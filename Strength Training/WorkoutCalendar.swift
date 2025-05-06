//
//  DayWorkoutData.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/11/25.
//

import SwiftUI

// All muscle groups tracked in the app.
let muscleGroupNames = ["Arms", "Shoulder", "Leg", "Back", "Chest", "Abs"]

// a potential calendar day
let daysCalendar = Locale.current.calendar
let specificDay = daysCalendar.date(from: daysCalendar.dateComponents([.year, .month, .day], from: Date()))!
// var month  = daysCalendar.component(.month, from: specificDay)
// var year = daysCalendar.component(.year, from: specificDay)
 var day = daysCalendar.component(.day, from: specificDay)

///
/// Represents one day in the workout calendar with toggles for each muscle group.
struct WorkoutDay: Identifiable, Codable {
    var date: Date
    var muscleGroups: [String: Bool] = Dictionary(uniqueKeysWithValues: muscleGroupNames.map { ($0, false) })
    var id: Date { date }
    
    var dayNumber: Int {
       daysCalendar.component(.day, from: date)
    }
}

/// A calendar of days with its associated workouts
class WorkoutCalendar: ObservableObject {
//    var month  = daysCalendar.component(.month, from: specificDay)
    
    @Published var days: DayDictionary = [:]
    
    typealias DayDictionary = [Date: WorkoutDay]

    
    func generateDays(forMonth month: Int, year: Int, day: Int) {
        days = [:]  ///clear previous days
        let components = DateComponents(year: year, month: month, day: day)
        if let date = daysCalendar.date(from: components),
           let range = daysCalendar.range(of: .day, in: .month, for: date) {
            for day in range {
                let dateComponents = DateComponents(year: year, month: month, day: day)
                if let date2 = daysCalendar.date(from: dateComponents) {
                    days[daysCalendar.date(from: daysCalendar.dateComponents([.year, .month, .day], from: date2))!] = WorkoutDay(date: date2)
                }
            }
        }
    }
    
//    @Published var days: DayDictionary = [:]
    
//    private let saveKey = "WorkoutCalendarSaveKey"
//
//    init() {
//        load()
//    }
//
//    func save() {
//        if let encoded = try? JSONEncoder().encode(days) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
//        }
//    }
//
//    func load() {
//        if let savedData = UserDefaults.standard.data(forKey: saveKey),
//           let decoded = try? JSONDecoder().decode([DayDictionary].self, from: savedData) {
//            days = decoded
//        }
//    }
}

