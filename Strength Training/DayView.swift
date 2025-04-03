//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI


//The destination that clicking on a day showcases. This includes the buttons to add muscle group information to the day, and the corresponding text from the dayWorkouts string array.

struct DayView: View {

    @ObservedObject var workoutInfo: Workouts 
    
    let dayNumber: Int
    
    var body: some View {
        
        VStack {
            ForEach(workoutInfo.dayWorkouts, id: \.self) { info in
                Text(info)
            }
            
            
            
            HStack {
                Button("Arm") {

                    if(workoutInfo.dayWorkouts.contains("Arms Programming") == false){
                        workoutInfo.dayWorkouts.append("Arms Programming")
                    }
                    else{
                        let armIndex = workoutInfo.dayWorkouts.firstIndex(of: "Arms Programming");
                        workoutInfo.dayWorkouts.remove(at: armIndex ?? 0);
                    }
                }
                Button("Shoulder") {
                    if(workoutInfo.dayWorkouts.contains("Shoulder Programming") == false){
                        workoutInfo.dayWorkouts.append("Shoulder Programming")
                    }
                    else{
                        let shoulderIndex = workoutInfo.dayWorkouts.firstIndex(of: "Shoulder Programming");
                        workoutInfo.dayWorkouts.remove(at: shoulderIndex ?? 0);
                    }
                }
                Button("Leg") {
                    if(workoutInfo.dayWorkouts.contains("Leg Programming") == false){
                        workoutInfo.dayWorkouts.append("Leg Programming")
                    }
                    else{
                        let legIndex = workoutInfo.dayWorkouts.firstIndex(of: "Leg Programming");
                        workoutInfo.dayWorkouts.remove(at: legIndex ?? 0);
                    }
                }
                Button("Back") {
                    if(workoutInfo.dayWorkouts.contains("Back Programming") == false){
                        workoutInfo.dayWorkouts.append("Back Programming")
                    }
                    else{
                        let backIndex = workoutInfo.dayWorkouts.firstIndex(of: "Back Programming");
                        workoutInfo.dayWorkouts.remove(at: backIndex ?? 0);
                    }
                }
                Button("Chest") {
                    if(workoutInfo.dayWorkouts.contains("Chest Programming") == false){
                        workoutInfo.dayWorkouts.append("Chest Programming")
                    }
                    else{
                        let chestIndex = workoutInfo.dayWorkouts.firstIndex(of: "Chest Programming");
                        workoutInfo.dayWorkouts.remove(at: chestIndex ?? 0);
                    }
                }
                Button("Abs") {
                    if(workoutInfo.dayWorkouts.contains("Abs Programming") == false){
                        workoutInfo.dayWorkouts.append("Abs Programming")
                    }
                    else{
                        let absIndex = workoutInfo.dayWorkouts.firstIndex(of: "Abs Programming");
                        workoutInfo.dayWorkouts.remove(at: absIndex ?? 0);
                    }

                }
            }
        }
        
//        .frame(width: , height: 10000, alignment: .center)

    }
}







