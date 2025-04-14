//
//  DayWorkoutData.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//

import SwiftUI


// List of all muscle groups tracked in the app.
let muscleGroupNames = ["Arms", "Shoulder", "Leg", "Back", "Chest", "Abs"]


// Represents one day in the workout calendar with toggles for each muscle group.
struct WorkoutDay: Identifiable {
    var dayNumber: Int
    var muscleGroups: [String: Bool] = Dictionary(
        uniqueKeysWithValues: muscleGroupNames.map { ($0, false) }
    )
    var id: Int { dayNumber }
}

// Holds the full list of 'WorkoutDay' structs (42 total) for the calendar.
class WorkoutCalendar: ObservableObject {
    @Published var days: [WorkoutDay] = (0...41).map {
        WorkoutDay(dayNumber: $0)
    }
}
