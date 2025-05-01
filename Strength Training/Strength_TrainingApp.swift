//
//  Strength_TrainingApp.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI

@main
struct Strength_TrainingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(
                                    minWidth: 1250, maxWidth: 1250,
                                    minHeight: 700, maxHeight: 700)
                }
        .windowResizability(.contentSize)
            }
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

