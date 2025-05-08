//
//  Workouts.swift
//  Strength Training
//
//  Created by Nathan Gumagay on 4/18/25.
//

import SwiftUI

//Structure that allows us to make workouts to display for the user.
struct Workout: Identifiable {
    let name: String
    let muscleGroup: String
    let description: String
    
    let id = UUID()
    
}

//Function that takes in a certain muscle group and will return a workout, for the DayCard so that when user chooses a muscle group they can see workouts attached to it.
func workouts(for muscleGroup: String) -> [Workout] {
    return workoutsByMuscleGroup[muscleGroup] ?? []
}

private let workoutsByMuscleGroup: [String: [Workout]] = [
    "Arms": [
        Workout(name: "Preacher Curls", muscleGroup: "Arms", description: "Bicep exercise using a preacher bench"),
        Workout(name: "Seated Concentration Curls", muscleGroup: "Arms", description: "Isolated bicep exercise"),
        Workout(name: "Cable Curls", muscleGroup: "Arms", description: "Bicep exercise using cable machine"),
        Workout(name: "Tricep Machine", muscleGroup: "Arms", description: "Seated tricep extension press"),
        Workout(name: "Hammer Curls", muscleGroup: "Arms", description: "Neutral-grip bicep strengthening"),
        Workout(name: "Cable Pushdowns", muscleGroup: "Arms", description: "Controlled tricep rope extensions"),
        Workout(name: "Standing Bicep Curls DB", muscleGroup: "Arms", description: "Upright dumbbell arm curls"),
        Workout(name: "Dumbbell Pullover", muscleGroup: "Arms", description: "Chest and lats stretch"),
        Workout(name: "Barbell Curl", muscleGroup: "Arms", description: "Standard heavy bicep curl"),
        Workout(name: "Overhead Tricep Extensions", muscleGroup: "Arms", description: "Arms raised tricep stretch"),
        Workout(name: "Bicep Curl Machine", muscleGroup: "Arms", description: "Guided bicep contraction workout"),
        Workout(name: "Zottman Curls", muscleGroup: "Arms", description: "Curl with twist-down motion")

        
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

