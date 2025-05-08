//
//  DayWorkoutData.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//

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

/// A calendar of days with its associated workouts
class WorkoutCalendar {
    private var days: DayDictionary = [:]
    typealias DayDictionary = [Date: WorkoutDay]
    
    func workoutDay(forDate date: Date) -> WorkoutDay {
        if let dayWorkout = days[date] {
            return dayWorkout
        }
        let newWorkout = WorkoutDay(date: date)
        days[date] = newWorkout
        return newWorkout
    }
    
    private let saveKey = "WorkoutCalendarSaveKey"

    init() {
        load()
    }

    func save() {
        do {
            let encoded = try JSONEncoder().encode(days)
            UserDefaults.standard.set(encoded, forKey: saveKey)
        } catch {
            print("Unable to save workouts:", error)
        }
    }

    func load() {
        if let savedData = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode(DayDictionary.self, from: savedData) {
            days = decoded
        }
    }
}

