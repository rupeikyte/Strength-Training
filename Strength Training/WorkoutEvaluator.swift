//
//  WorkoutManager.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//

// Provides logic for evaluating workout patterns across days.
// Currently keeps track of days with back to back programming of identical muscle groups
struct WorkoutEvaluator {
    static func getAllBackToBack(in days: [WorkoutDay]) -> Set<Int> {
        var result: Set<Int> = []
        
        for muscle in muscleGroupNames {
            for i in 0..<days.count {
                if (i>0) {
                    if days[i - 1].muscleGroups[muscle] == true &&
                        days[i].muscleGroups[muscle] == true {
                        result.insert(days[i - 1].dayNumber)
                        result.insert(days[i].dayNumber)
                    }
                }
            }
        }
        return result
    }
    
    func dayOverload(in days: [WorkoutDay]) -> Bool {
        var consecutiveWorkoutDays = 0
        
        for day in days {
            //check if any muscle group is trained on this day
            let isWorkoutDay = day.muscleGroups.values.contains(true)
            
            if isWorkoutDay {
                consecutiveWorkoutDays += 1
                if consecutiveWorkoutDays >= 4 {
                    return true //overload detected
                }
            } else {
                consecutiveWorkoutDays = 0 //reset counter on rest day
            }
        }
        
        return false
    }
    
    func isEverythingGettingTrained(in days: [WorkoutDay]) -> Bool {
        //create a dictionary to track if each muscle group has been trained
        var muscleGroupsCovered = Dictionary(
            uniqueKeysWithValues: muscleGroupNames.map { ($0, false) }
        )
        
        //check each day's muscle groups
        for day in days {
            for (muscle, isWorked) in day.muscleGroups {
                if isWorked {
                    muscleGroupsCovered[muscle] = true
                }
            }
        }
        
        //return false if any muscle group hasn't been trained
        return !muscleGroupsCovered.values.contains(false)
    }
    
    
    func isThereCorrectMuscleRepetition(in days: [WorkoutDay]) -> Bool {
        var muscleGroupsCovered = Dictionary(
            uniqueKeysWithValues: muscleGroupNames.map { ($0, uniqueKeysWithValues: muscleGroupNames.map { ($0, false) }) }
        )
        
        for day in days {
            for (muscle, isWorked) in day.muscleGroups {
                if isWorked {
                    muscleGroupsCovered[muscle].value = true
                }
            }

        }
        return !muscleGroupsCovered.values.values.contains(false)
    }
}
