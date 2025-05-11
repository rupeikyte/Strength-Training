//
//  Strength_TrainingApp.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI

@main
///The app. The frame of the app is restricted so that a user can only make the window size about half as big as the window screen. 
struct Strength_TrainingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 1000, minHeight: 600)
        }
        .windowResizability(.automatic)
    }
}
