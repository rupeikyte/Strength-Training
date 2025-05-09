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
    
    /// function that catches if a user chooses to workout the same muscle group on back to back days
    /// - Parameter days: Array of workout days
    /// - Returns: An array of an array of integers giving us two integers per array
    static func getAllBackToBack(in workoutDays: [WorkoutDay]) -> [Date: [String]] {
        var result: [Date: [String]] = [:]
        
        for muscleGroup in muscleGroupNames {
            var dayBeforeWithThisMuscle: WorkoutDay? = nil
            
            let sortedWorkoutDays = workoutDays.sorted(by: { $0.date < $1.date })
            for currentWorkoutDay in sortedWorkoutDays {
                if currentWorkoutDay.muscleGroups.contains(muscleGroup) {
                    if let previousWorkout = dayBeforeWithThisMuscle {
                        let calendar = Calendar.current
                        if let nextDay = calendar.date(byAdding: .day, value: 1, to: previousWorkout.date) {
                            if calendar.isDate(nextDay, inSameDayAs: currentWorkoutDay.date) {
                                result[currentWorkoutDay.date, default: []].append(muscleGroup)
                                result[previousWorkout.date, default: []].append(muscleGroup)
                            }
                        }
                    }
                    dayBeforeWithThisMuscle = currentWorkoutDay
                } else {
                    dayBeforeWithThisMuscle = nil
                }
            }
        }
        
        return result
    }
    
    //    static func getAllBackToBack(in days: [WorkoutDay]) -> [String: [[Int]]] {
    //        var result: [String: [[Int]]] = [:]
    //
    //        for muscle in muscleGroupNames {
    //            var currentStreak: [Int] = []
    //
    //            for i in 0..<days.count {
    ////                if days[i].muscleGroups[muscle] == true {
    ////                    if currentStreak.isEmpty || days[i].dayNumber == currentStreak.last! + 1 {
    ////                        currentStreak.append(days[i].dayNumber)
    ////                    } else {
    ////                        if currentStreak.count > 1 {
    ////                            result[muscle, default: []].append(currentStreak)
    ////                        }
    ////                        currentStreak = [days[i].dayNumber]
    ////                    }
    ////                }
    //            }
    //
    //            if currentStreak.count > 1 {
    //                result[muscle, default: []].append(currentStreak)
    //            }
    //        }
    //
    //        return result
    //    }
    
    
    /// Function that catches if users choose too many workouts in a row, not accounting for a rest day.
    /// - Parameter days: Array of workout days
    /// - Returns: true or false
    func dayOverload(in days: [WorkoutDay]) -> Bool {
        var consecutiveWorkoutDays = 0
        
        for day in days {
            ///check if any muscle group is trained on this day
            let isWorkoutDay = !day.muscleGroups.isEmpty
            
            if isWorkoutDay {
                consecutiveWorkoutDays += 1
                if consecutiveWorkoutDays >= 4 {
                    return true ///overload detected
                }
            } else {
                consecutiveWorkoutDays = 0 ///reset counter on rest day
            }
        }
        return false
    }
    
    /// Function that looks throughout the user's month and catches if the user has not chosen every muscle group at least once throughout the month.
    /// - Parameter days: Array of workout days
    /// - Returns: true or false
    func isEverythingGettingTrained(in days: [WorkoutDay]) -> Bool {
        ///create a dictionary to track if each muscle group has been trained
        var muscleGroupsCovered = Dictionary(
            uniqueKeysWithValues: muscleGroupNames.map { ($0, false) }
        )
        
        ///check each day's muscle groups
        for day in days {
            for muscle in day.muscleGroups {
                muscleGroupsCovered[muscle] = true
            }
        }
        ///return false if any muscle group hasn't been trained
        return !muscleGroupsCovered.values.contains(false)
    }
    
    
    /// TODO: FIX BELOW
    ///Function that gets the very first day someone input their workouts, and starts checking every seven days afterwards to test if a musclegroup has been trained. OR begins at the beginning of the month, looking only at a single month, checking every (AVAILABLE) seven days for each muscle group. 
//    func groupTwicePerWeek(in workoutDays: [WorkoutDay]) -> [Date: [String]] {
//        
//    }
    
    
    //    func isThereCorrectMuscleRepetition(in days: [WorkoutDay]) -> Bool {
    //        var muscleGroupsCovered = Dictionary(
    //            uniqueKeysWithValues: muscleGroupNames.map { ($0, uniqueKeysWithValues: muscleGroupNames.map { ($0, false) }) }
    //        )
    //
    //        for day in days {
    //            for (muscle, isWorked) in day.muscleGroups {
    //                if isWorked {
    //                    muscleGroupsCovered[muscle].value = true
    //                }
    //            }
    //
    //        }
    //        return !muscleGroupsCovered.values.values.contains(false)
    //    }
}
