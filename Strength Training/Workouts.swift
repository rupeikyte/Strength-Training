//
//  Workouts.swift
//  Strength Training
//
//  Created by Nathan Gumagay on 4/18/25.
//

import SwiftUI

struct Workout: Identifiable {
    let name: String
    let muscleGroup: String
    let description: String
    
    let id = UUID()
    
}

func workouts(for muscleGroup: String) -> [Workout] {
    return workoutsByMuscleGroup[muscleGroup] ?? []
}

private let workoutsByMuscleGroup: [String: [Workout]] = [
    "Arms": [
        Workout(name: "Preacher Curls", muscleGroup: "Arms", description: "Bicep exercise using a preacher bench"),
        Workout(name: "Seated Concentration Curls", muscleGroup: "Arms", description: "Isolated bicep exercise"),
        Workout(name: "Cable Curls", muscleGroup: "Arms", description: "Bicep exercise using cable machine")
    ],
    "Back": [
        Workout(name: "Neutral Grip Pulldowns", muscleGroup: "Back", description: "Lat exercise using cable machine"),
        Workout(name: "Seated Machine Rows", muscleGroup: "Back", description: "Back exercise using row machine"),
        Workout(name: "Pull Ups (Assisted)", muscleGroup: "Back", description: "Upper body compound exercise"),
        Workout(name: "Single Arm DB Row", muscleGroup: "Back", description: "Unilateral back exercise")
    ],
    "Leg": [
        Workout(name: "Back Squat", muscleGroup: "Leg", description: "Compound leg exercise"),
        Workout(name: "Leg Extensions", muscleGroup: "Leg", description: "Quad isolation exercise"),
        Workout(name: "Hamstring Curls Machine", muscleGroup: "Leg", description: "Hamstring isolation exercise"),
        Workout(name: "DB Calf Raises", muscleGroup: "Leg", description: "Calf exercise using dumbbells")
    ],
    "Chest": [
        Workout(name: "Bench Press Barbell", muscleGroup: "Chest", description: "Compound chest exercise"),
        Workout(name: "Incline Bench Press DB", muscleGroup: "Chest", description: "Upper chest exercise"),
        Workout(name: "Pec Deck", muscleGroup: "Chest", description: "Chest isolation exercise"),
        Workout(name: "Cable Flys", muscleGroup: "Chest", description: "Chest exercise using cables")
    ],
    "Shoulder": [
        Workout(name: "Lateral Raises", muscleGroup: "Shoulder", description: "Shoulder isolation exercise"),
        Workout(name: "Band Pull Aparts", muscleGroup: "Shoulder", description: "Rear delt exercise"),
        Workout(name: "Cable Single Arm Rear Delt Flys", muscleGroup: "Shoulder", description: "Rear delt isolation"),
        Workout(name: "Shoulder Press Machine", muscleGroup: "Shoulder", description: "Compound shoulder exercise")
    ],
    "Abs": [
        Workout(name: "Mountain Climbers", muscleGroup: "Abs", description: "Dynamic core exercise"),
        Workout(name: "Elbow Plank with Toe Taps", muscleGroup: "Abs", description: "Core stability exercise"),
        Workout(name: "Right Side Plank", muscleGroup: "Abs", description: "Core and oblique exercise"),
        Workout(name: "Left Side Plank", muscleGroup: "Abs", description: "Core and oblique exercise"),
        Workout(name: "Lower Ab Crunches", muscleGroup: "Abs", description: "Lower abdominal exercise"),
        Workout(name: "Bicycle Crunches", muscleGroup: "Abs", description: "Dynamic core exercise"),
        Workout(name: "Ukrainian Twists", muscleGroup: "Abs", description: "Rotational core exercise"),
        Workout(name: "High Boat to Low Boat", muscleGroup: "Abs", description: "Core stability exercise")
    ]
]

