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
    "Back": ["Neutral Grip Pulldowns","Seated Machine Rows","Pull Ups (Assisted)", "Single Arm DB Row"],
    "Leg": ["Back Squat", "Leg Extensions", "Hamstring Curls Machine", "DB Calf Raises"],
    "Chest": ["Bench Bress Barbell", "Incline Bench Press DB", "Pec Deck", "Cable Flys"],
    "Shoulder": ["Lateral Raises", "Band Pull Aparts", "Cable Single Arm Rear Delt Flys", "Shoulder Press Machine"],
    "Abs": ["Mountain Climbers", "Elbow Plank with Toe Taps", "Right Side Plank","Left Side Plank", "Lower Ab Crunches", "Bicycle Crunches", "Ukranian Twists", "High Boat to Low Boat"],
]

