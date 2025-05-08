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
        Workout(name: "Single Arm DB Row", muscleGroup: "Back", description: "Unilateral back exercise"),
        Workout(name: "Barbell Row", muscleGroup: "Back", description: "Rowing back excercise using a barbell"),
        Workout(name:"Rear Delt Cable Flys", muscleGroup: "Back", description: "Cable single arm pull across body"),
        Workout(name: "Knee down Cable Pull", muscleGroup: "Back", description: "Lat excercise using cable (single arm)"),
        Workout(name: "T Bar Rows", muscleGroup: "Back", description: "Row using a T-Bar on 45 degree bench"),
        Workout(name: "Chin Ups", muscleGroup: "Back", description: "Compund excercise targeting only lats"),
        Workout(name: "Cable Pulldown", muscleGroup: "Back", description: "rope pulls with a 45 degree body angle")
    ],
    "Leg": [
        Workout(name: "Back Squat", muscleGroup: "Leg", description: "Compound leg exercise"),
        Workout(name: "Leg Extensions", muscleGroup: "Leg", description: "Quad isolation exercise"),
        Workout(name: "Hamstring Curls Machine", muscleGroup: "Leg", description: "Hamstring isolation exercise"),
        Workout(name: "DB Calf Raises", muscleGroup: "Leg", description: "Calf exercise using dumbbells"),
        Workout(name: "Cable Kickbacks", muscleGroup: "Leg", description: "Cable attached to ankle with kicking back motion"),
        Workout(name: "DB RDL", muscleGroup: "Leg",description: "Romanian deadlift motion using dumbbells"),
        Workout(name: "DB Bulgarian Split Squat", muscleGroup: "Leg",description: "split squat with rear foot elevated"),
        Workout(name: "Leg Press", muscleGroup: "Leg",description: "Leg exercise using press machine"),
        Workout(name: "Leg Extensions", muscleGroup: "Leg",description: "Leg excercise using extension machine"),
        Workout(name: "Hip Abduction Machine", muscleGroup: "Leg",description: "Leg excercise using abductor machine"),
        Workout(name: "DB Side Lunges", muscleGroup: "Leg",description: "Lunging out sideways with dumbbells"),
        Workout(name: "Barbell Hip Thrust", muscleGroup: "Leg",description: "Hip thrust motion with barbell laying across pelvis"),
        Workout(name: "Hack Squat Machine", muscleGroup: "Leg",description: "Leg excercise using hack squat machine"),
        Workout(name: "DB Reverse Lunges", muscleGroup: "Leg",description: "Lunging back with dumbbells"),
        Workout(name: "DB Sumo Squat", muscleGroup: "Leg",description: "One arm with dumbbell hanging with sumo motion"),
        Workout(name: "Barbell Split Squat", muscleGroup: "Leg",description: "Lunging back with barbell on back")
        
    ],
    "Chest": [
        Workout(name: "Bench Press Barbell", muscleGroup: "Chest", description: "Compound chest exercise"),
        Workout(name: "Incline Bench Press DB", muscleGroup: "Chest", description: "Upper chest exercise"),
        Workout(name: "Pec Deck", muscleGroup: "Chest", description: "Chest isolation exercise"),
        Workout(name: "Cable Flys", muscleGroup: "Chest", description: "Chest exercise using cables"),
        Workout(name: "DB Bench Press", muscleGroup: "Chest", description: "Compund chest press with dumbbells"),
        Workout(name: "Incline Bench Press Barbell", muscleGroup: "Chest", description: "Upper chest press with barbell"),
        Workout(name: "Regular Pushup", muscleGroup: "Chest", description: "Compound chest by pushing body up"),
        Workout(name: "Wide Pushup", muscleGroup: "Chest", description: "Pushup with emphasis on only chest use"),
        Workout(name: "Diamond Pushup", muscleGroup: "Chest", description: "Pushup with greater difficulty"),
        Workout(name: "Elevated Pushup", muscleGroup: "Chest", description: "Pushup with emphasis on upper chest"),
        Workout(name: "Bodyweight Dips", muscleGroup: "Chest", description: "Compund excercise, lower chest emphasis"),
        Workout(name: "DB Flys", muscleGroup: "Chest", description: "Compund excercise using dumbbells"),
        Workout(name: "Military Pushup", muscleGroup: "Chest", description: "Tougher pushup, takes more effort"),
        Workout(name: "Weighted Pushup", muscleGroup: "Chest", description: "Pushup with weight on back")
    ],
    "Shoulder": [
        Workout(name: "Lateral Raises", muscleGroup: "Shoulder", description: "Shoulder isolation exercise"),
        Workout(name: "Band Pull Aparts", muscleGroup: "Shoulder", description: "Rear delt exercise"),
        Workout(name: "Cable Single Arm Rear Delt Flys", muscleGroup: "Shoulder", description: "Rear delt isolation"),
        Workout(name: "Shoulder Press Machine", muscleGroup: "Shoulder", description: "Compound shoulder exercise"),
        Workout(name: "Shoulder Press DB", muscleGroup: "Shoulder", description: "Compund shoulder excercise"),
        Workout(name: "Military Press", muscleGroup: "Shoulder", description: "Standing/restricted shoulder excercise"),
        Workout(name: "Upright Row", muscleGroup: "Shoulder", description: "Rear delt excercise bringing dumbbell up"),
        Workout(name: "Rear Delt Flys", muscleGroup: "Shoulder", description: "Machine rear delt excercise"),
        Workout(name: "Face Pulls", muscleGroup: "Shoulder", description: "Rear delt excercise with cables")
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

