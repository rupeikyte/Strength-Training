//
//  Workouts.swift
//  Strength Training
//
//  Created by Nathan Gumagay on 4/18/25.
//

import SwiftUI

func workouts(for muscleGroup: String) -> [String] {
    return workoutsByMuscleGroup[muscleGroup] ?? []
}

private let workoutsByMuscleGroup: [String: [String]] = [
    "Arms": ["Preacher Curls: ", "Seated Concentration Curls", "Cable Curls"],
    "Back": ["Lat Pulldown","Cable Row","Pull Ups"],
    "Leg": ["Back Squat", "Two DB RDL", "Hamstring Curl", "Leg Extensions"],
    "Chest": ["Bench Bress BB", "Incline Bench Press DB", "Cable Flys"],
    "Shoulder": ["Shoulder Press Machine", "Shoulder Press DB"],
    "Abs": ["Crunches", "Plank", "Deadbug", "Bicycle for 30 sec"],
]

