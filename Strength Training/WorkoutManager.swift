//
//  WorkoutManager.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//


// Provides logic for evaluating workout patterns across days.
// Currently keeps track of days with back to back programming of identical muscle groups
struct WorkoutManager {
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
}
