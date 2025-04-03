//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI


//The destination that clicking on a day showcases. This includes the buttons to add muscle group information to the day, and the corresponding text from the dayWorkouts string array.

struct DayView: View {

//    @ObservedObject var workoutInfo: Workouts
    @StateObject private var workoutInfo = Workouts()
    
    let dayNumber: Int
    
    var body: some View {
        
        VStack {
            ForEach(workoutInfo.dayWorkouts, id: \.self) { info in
                Text(info)
//                Text(dayNumber.description)
            }
            
            
            
            HStack {
                Button("Arm") {
                    workoutInfo.dayWorkouts.append("Arms Programming")
                }
                Button("Shoulder") {
                    workoutInfo.dayWorkouts.append("Shoulder Programming")
                }
                Button("Leg") {
                    workoutInfo.dayWorkouts.append("Leg Programming")
                }
                Button("Back") {
                    workoutInfo.dayWorkouts.append("Back Programming")
                }
                Button("Chest") {
                    workoutInfo.dayWorkouts.append("Chest Programming")
                }
                Button("Abs") {
                    workoutInfo.dayWorkouts.append("Abs Programming")
                }
            }
        }
    }
}


//class Workouts: ObservableObject {
//    @Published var dayWorkouts: [String] = []
//    
//    init() {
//        
//    }
// }




