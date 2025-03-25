//
//  WorkoutManager.swift
//  Strength Training
//
//  Created by Noel Raehl on 3/24/25.
//


struct Day {
    var muscleGroupProgramming: [String: Bool]
}

class WorkoutManager {
    var days: [Day]
    
    let muscleGroups = ["Legs", "Abs", "Back", "Chest", "Shoulders", "Arms"]
    
    init() {
        days = Array(repeating: Day(muscleGroupProgramming: Dictionary(uniqueKeysWithValues: muscleGroups.map { ($0, false) })), count: 35)
    }
    
    func programMuscleGroup(for dayIndex: Int, muscleGroup: String) {
        days[dayIndex].muscleGroupProgramming[muscleGroup] = true
    }
    
    func checkConsecutiveDays() -> [String: [(Int, Int)]] {
        var consecutiveIssues: [String: [(Int, Int)]] = [:]
        
        for i in 1..<days.count {
            let previousDay = days[i - 1]
            let currentDay = days[i]
            
            for muscleGroup in muscleGroups {
                if previousDay.muscleGroupProgramming[muscleGroup] == true &&
                    currentDay.muscleGroupProgramming[muscleGroup] == true {
                    let dayPair = (i - 1, i)
                    consecutiveIssues[muscleGroup, default: []].append(dayPair)
                }
            }
        }
        
        return consecutiveIssues
    }
    
    func checkWeeklyFrequency(){
        
    }
    
}
