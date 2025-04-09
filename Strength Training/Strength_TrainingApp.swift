//
//  Strength_TrainingApp.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI
import SwiftData

@main
struct Strength_TrainingApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    
    // mystery algorithm
    
    //takes in a month of workouts
    
    // for day in month
    // if day.hasWorkout
    //   check if day has <=  3 workouts
    //   for (2 consecutive days){check if the muscle group is not touched again} if false, error
    //   for (3){check if the next three days .hasWorkout}  if true, error
    //   for (6){check if muscle group hit again} if not, error
    //  check all muscle groups that have been hit in this day (putIfAbsent like in maps)
}
