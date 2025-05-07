//
//  DayWorkoutData.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//

import SwiftUI

// All muscle groups tracked in the app.
let muscleGroupNames = ["Arms", "Shoulder", "Leg", "Back", "Chest", "Abs"]

let daysCalendar = Locale.current.calendar

///
/// Represents one day in the workout calendar with toggles for each muscle group.
class WorkoutDay: Identifiable, ObservableObject
//, Codable
{
    
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
    
    
}

/// A calendar of days with its associated workouts
class WorkoutCalendar: ObservableObject {
    
    @State private var days: DayDictionary = [:]
    
    typealias DayDictionary = [Date: WorkoutDay]
    
    func workoutDay(forDate date: Date) -> WorkoutDay {
        if let dayWorkout = days[date] {
            return dayWorkout
        }
        let newWorkout = WorkoutDay(date: date)
        days[date] = newWorkout
        return newWorkout
    }

//    
//    func generateDays(forMonth month: Int, year: Int, day: Int) {
//        days = [:]  ///clear previous days
//        let components = DateComponents(year: year, month: month, day: day)
//        if let date = daysCalendar.date(from: components),
//           let range = daysCalendar.range(of: .day, in: .month, for: date) {
//            for day in range {
//                let dateComponents = DateComponents(year: year, month: month, day: day)
//                if let date2 = daysCalendar.date(from: dateComponents) {
//                    days[daysCalendar.date(from: daysCalendar.dateComponents([.year, .month, .day], from: date2))!] = WorkoutDay(date: date2)
//                }
//            }
//        }
//    }
    
//    @Published var days: DayDictionary = [:]
    
//    private let saveKey = "WorkoutCalendarSaveKey"
//
//    init() {
//        load()
//    }
//
//    func save() {
//        if let encoded = try? JSONEncoder().encode(days) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
//        }
//    }
//
//    func load() {
//        if let savedData = UserDefaults.standard.data(forKey: saveKey),
//           let decoded = try? JSONDecoder().decode([DayDictionary].self, from: savedData) {
//            days = decoded
//        }
//    }
}

