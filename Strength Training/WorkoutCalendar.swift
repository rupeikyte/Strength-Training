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
    var dayNumber: Int
    var muscleGroups: [String: Bool] = Dictionary(
        uniqueKeysWithValues: muscleGroupNames.map { ($0, false) }
    )
    var id: Int { dayNumber }
}


/// A calendar of days with its associated workouts
class WorkoutCalendar: ObservableObject {
    @State var month  = daysCalendar.component(.month, from: specificDay)
    
//    @Published var days: [WorkoutDay] = (0...42).map { WorkoutDay(dayNumber: $0) }
    
    typealias DayDictionary = [Date: WorkoutDay]
    @Published var days: DayDictionary = [specificDay: WorkoutDay(dayNumber: day)]
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

