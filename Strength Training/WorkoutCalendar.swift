//
//  DayWorkoutData.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//  Code used for notifyAll function: https://stackoverflow.com/questions/72825281/objectwillchange-send-how-exactly-does-this-work#:~:text=SwiftUI%20uses%20the%20objectWillChange%20Publisher,to%20manually%20update%20the%20view
//  Code used for making WorkoutDay codable: https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties
// Code for starOfDay: https://stackoverflow.com/questions/78686270/why-does-date-and-calendar-current-startofdayfor-date-produce-different-d
// Code used for intersection: https://stackoverflow.com/questions/69727288/swift-how-to-check-intersection-with-multiple-sets
// Code used for date and calendar logic throughout this project: https://www.advancedswift.com/date-formatter-cheatsheet-formulas-swift/
//Code used for operations on a Set: https://stackoverflow.com/questions/48814172/set-collection-insert-multiple-elements
//Code used for operations on a Set: https://stackoverflow.com/questions/45134687/given-two-sets-how-can-i-determine-what-was-added-or-removed

import SwiftUI

///All muscle groups tracked in the app.
let muscleGroupNames = ["Arms", "Shoulder", "Leg", "Back", "Chest", "Abs"]
let daysCalendar = Locale.current.calendar

/// Represents one day in the workout calendar with toggles for each muscle group.
class WorkoutDay: Identifiable, ObservableObject, Codable {
    @Published var muscleGroups: Set<String> = []
    var date: Date
    var id: Date { date }
    var dayOfMonth: Int {
       daysCalendar.component(.day, from: date)
    }
    init(muscleGroups: Set<String> = [], date: Date) {
        self.muscleGroups = muscleGroups
        self.date = date
    }
    enum CodingKeys: CodingKey {
        case muscleGroups
        case date
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        muscleGroups = try container.decode(Set.self, forKey: .muscleGroups)
        date = try container.decode(Date.self, forKey: .date)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(muscleGroups, forKey: .muscleGroups)
        try container.encode(date, forKey: .date)
    }
}

/// A dictionary of a calendar of days with its associated workouts. The keys are the date, and the set of workouts are the value.
class WorkoutCalendar: ObservableObject {
    private var days: DayDictionary = [:]
    typealias DayDictionary = [Date: WorkoutDay]
    
    /// A way to get the workout set, if the function is given a date.
    func workoutDay(forDate date: Date) -> WorkoutDay {
        if let dayWorkout = days[date] {
            return dayWorkout
        }
        let newWorkout = WorkoutDay(date: date)
        days[date] = newWorkout
        return newWorkout
    }
    func notifyAll() {
        objectWillChange.send()
    }
    private let saveKey = "WorkoutCalendarSaveKey"
    init() {
        load()
    }
    
    /// Saves the data that is inputed into the calendar.
    func save() {
        do {
            let encoded = try JSONEncoder().encode(days)
            UserDefaults.standard.set(encoded, forKey: saveKey)
        } catch {
            print("Unable to save workouts:", error)
        }
    }
    
    /// Loads the data that is inputed into the calendar.
    func load() {
        if let savedData = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode(DayDictionary.self, from: savedData) {
            days = decoded
        }
    }
    
    /// Function that catches if a user chooses to workout the same muscle group on back to back days.
    /// - Returns: An array of an array of integers giving us two integers per array
    func getAllBackToBack() -> [Date: [String]] {
        let sortedDays = days.sorted(by: { $0.key < $1.key })
        var result: [Date: [String]] = [:]
        for i in 1..<sortedDays.count {
            let prev = sortedDays[i - 1]
            let curr = sortedDays[i]
            ///check if they are consecutive dates
            let dayAfterPrev = daysCalendar.date(byAdding: .day, value: 1, to: daysCalendar.startOfDay(for: prev.key))!
            let currDay = daysCalendar.startOfDay(for: curr.key)
            if currDay == dayAfterPrev {
                let repeated = prev.value.muscleGroups.intersection(curr.value.muscleGroups)
                if !repeated.isEmpty {
                    result[curr.key] = Array(repeated)
                }
            }
        }
        return result
    }
        
    /// Catches if users choose workouts on 4 or more consecutive days, not accounting for rest
    /// - Returns: A dicitionary, dates as keys and an array of strings/muscle groups
    func dayOverload() -> [Date: [String]] {
        let sortedDays = days.sorted(by: { $0.key < $1.key })
        var result: [Date: [String]] = [:]
        var consecutiveCount = 0
        for i in 0..<sortedDays.count {
            let curr = sortedDays[i]
            let currDay = daysCalendar.startOfDay(for: curr.key)
            let isWorkoutDay = !curr.value.muscleGroups.isEmpty
            if i > 0 {
                let prev = sortedDays[i - 1]
                let expectedDay = daysCalendar.date(byAdding: .day, value: 1, to: daysCalendar.startOfDay(for: prev.key))!
                let prevWasWorkoutDay = !prev.value.muscleGroups.isEmpty
                
                if currDay == expectedDay && isWorkoutDay && prevWasWorkoutDay {
                    consecutiveCount += 1
                } else if isWorkoutDay {
                    consecutiveCount = 1
                } else {
                    consecutiveCount = 0
                }
            } else {
                ///first day
                consecutiveCount = isWorkoutDay ? 1 : 0
            }
            if consecutiveCount >= 5 {
                result[curr.key] = Array(curr.value.muscleGroups)
            }
        }
        return result
    }
        
    /// Catches when user does not choose every muscle group at least once throughout the month.
    /// - Parameters:
    ///   - month: An integer for the month
    ///   - year: An integer for the year
    /// - Returns: Set of strings of the untrained muscle groups
    func isEverythingGettingTrained(month: Int, year: Int) -> Set<String> {
        let allMuscleGroupsSet = Set(muscleGroupNames)
        let workoutDaysInMonth = getWorkoutDays(days: Array(self.days.values), forMonth: month, year: year)
        var trainedMusccleGroups: Set<String> = []
        for day in workoutDaysInMonth{
            trainedMusccleGroups.formUnion(day.muscleGroups)
        }
        let untrainedMuscleGroups = allMuscleGroupsSet.subtracting(trainedMusccleGroups)
        return untrainedMuscleGroups
    }
    
    /// Helper function to get days with workouts.
    /// - Parameters:
    ///   - days: array of WorkoutDays
    ///   - month: integer representing month
    ///   - year: integer representing year
    /// - Returns: Array of WorkoutDays
    func getWorkoutDays(days: [WorkoutDay], forMonth month: Int, year: Int) -> [WorkoutDay]{
        let daysCalendar = Locale.current.calendar
        return days.filter { day in
            let dayMonth = daysCalendar.component(.month, from: day.date)
            let dayYear = daysCalendar.component(.year, from: day.date)
            return dayMonth == month && dayYear == year
        }
    }
}

