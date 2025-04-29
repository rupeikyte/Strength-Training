//
//  DayWorkoutData.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//

import SwiftUI


// All muscle groups tracked in the app.
let muscleGroupNames = ["Arms", "Shoulder", "Leg", "Back", "Chest", "Abs"]


// Represents one day in the workout calendar with toggles for each muscle group.
struct WorkoutDay: Identifiable, Codable {
    var dayNumber: Int
    var muscleGroups: [String: Bool] = Dictionary(
        uniqueKeysWithValues: muscleGroupNames.map { ($0, false) }
    )
    var id: Int { dayNumber }
}


class WorkoutCalendar: ObservableObject {
    @Published var days: [WorkoutDay] = (0...42).map { WorkoutDay(dayNumber: $0) }
    
    private let saveKey = "WorkoutCalendarSaveKey"
    
    init() {
        load()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(days) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func load() {
        if let savedData = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([WorkoutDay].self, from: savedData) {
            days = decoded
        }
    }
}

