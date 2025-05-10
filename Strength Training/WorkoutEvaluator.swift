//
//  WorkoutManager.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//

import SwiftUI

// Provides logic for evaluating workout patterns across days.
// Currently keeps track of days with back to back programming of identical muscle groups
struct WorkoutEvaluator {
    
    /// Function that looks throughout the user's month and catches if the user has not chosen every muscle group at least once throughout the month.
    /// - Parameter days: Array of workout days
    /// - Returns: true or false
    func isEverythingGettingTrained(in days: [WorkoutDay]) -> Bool {
        ///create a dictionary to track if each muscle group has been trained
        var muscleGroupsCovered = Dictionary(
            uniqueKeysWithValues: muscleGroupNames.map { ($0, false) })
        
        ///check each day's muscle groups
        for day in days {
            for muscle in day.muscleGroups {
                muscleGroupsCovered[muscle] = true
            }
        }
        ///return false if any muscle group hasn't been trained
        return !muscleGroupsCovered.values.contains(false)
    }
    
}
