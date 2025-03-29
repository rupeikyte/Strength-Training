//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI

//let colors: [Color] = [.gray, .red, .orange, .yellow,
//                           .green, .blue, .purple, .pink]



struct DayView: View {
    @State private var workoutInfo: [String] = []
    
    let dayNumber: Int
    
    var body: some View {
        VStack {
            ForEach(workoutInfo, id: \.self) { info in
                Text(info)
                    .multilineTextAlignment(.center)
            }
            HStack {
                Button("Arm") {
                    workoutInfo.append("Arms Programming")
                }
                Button("Shoulder") {
                    workoutInfo.append("Shoulder Programming")
                }
                Button("Leg") {
                    workoutInfo.append("Leg Programming")
                }
                Button("Back") {
                    workoutInfo.append("Back Programming")
                }
                Button("Chest") {
                    workoutInfo.append("Chest Programming")
                }
                Button("Abs") {
                    workoutInfo.append("Abs Programming")
                }
            }
        }
    }
}
