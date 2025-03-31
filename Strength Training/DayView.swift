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
                    if(workoutInfo.contains("Arms Programming") == false){
                        workoutInfo.append("Arms Programming")
                    }
                    else{
                        let armIndex = workoutInfo.firstIndex(of: "Arms Programming");
                        workoutInfo.remove(at: armIndex ?? 0);
                    }
                }
                Button("Shoulder") {
                    if(workoutInfo.contains("Shoulder Programming") == false){
                        workoutInfo.append("Shoulder Programming")
                    }
                    else{
                        let shoulderIndex = workoutInfo.firstIndex(of: "Shoulder Programming");
                        workoutInfo.remove(at: shoulderIndex ?? 0);
                    }
                }
                Button("Leg") {
                    if(workoutInfo.contains("Leg Programming") == false){
                        workoutInfo.append("Leg Programming")
                    }
                    else{
                        let legIndex = workoutInfo.firstIndex(of: "Leg Programming");
                        workoutInfo.remove(at: legIndex ?? 0);
                    }
                }
                Button("Back") {
                    if(workoutInfo.contains("Back Programming") == false){
                        workoutInfo.append("Back Programming")
                    }
                    else{
                        let backIndex = workoutInfo.firstIndex(of: "Back Programming");
                        workoutInfo.remove(at: backIndex ?? 0);
                    }
                }
                Button("Chest") {
                    if(workoutInfo.contains("Chest Programming") == false){
                        workoutInfo.append("Chest Programming")
                    }
                    else{
                        let chestIndex = workoutInfo.firstIndex(of: "Chest Programming");
                        workoutInfo.remove(at: chestIndex ?? 0);
                    }
                }
                Button("Abs") {
                    if(workoutInfo.contains("Abs Programming") == false){
                        workoutInfo.append("Abs Programming")
                    }
                    else{
                        let absIndex = workoutInfo.firstIndex(of: "Abs Programming");
                        workoutInfo.remove(at: absIndex ?? 0);
                    }
                }
            }
        }
    }
}
