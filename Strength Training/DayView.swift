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
    
    @State private var armClicked: Bool = false
    @State private var shoulderClicked: Bool = false
    @State private var legClicked: Bool = false
    @State private var chestClicked: Bool = false
    @State private var backClicked: Bool = false
    @State private var absClicked: Bool = false

    
    var body: some View {
        
        VStack {
            ForEach(workoutInfo.dayWorkouts, id: \.self) { info in
                Text(info)
            }

            HStack {
                
                Button("Arm") {
                    armClicked = true
                    if(workoutInfo.dayWorkouts.contains("Arms Programming") == false){
                        workoutInfo.dayWorkouts.append("Arms Programming")
                    }
                    else{
                        let armIndex = workoutInfo.dayWorkouts.firstIndex(of: "Arms Programming");
                        workoutInfo.dayWorkouts.remove(at: armIndex ?? 0);
                        armClicked = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(armClicked ? Color.red : Color.green)
                
                Button("Shoulder") {
                    self.shoulderClicked = true
                    if(workoutInfo.dayWorkouts.contains("Shoulder Programming") == false){
                        workoutInfo.dayWorkouts.append("Shoulder Programming")
                    }
                    else{
                        let shoulderIndex = workoutInfo.dayWorkouts.firstIndex(of: "Shoulder Programming");
                        workoutInfo.dayWorkouts.remove(at: shoulderIndex ?? 0);
                        self.shoulderClicked = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(shoulderClicked ? Color.red : Color.green)
                
                Button("Leg") {
                    self.legClicked = true
                    if(workoutInfo.dayWorkouts.contains("Leg Programming") == false){
                        workoutInfo.dayWorkouts.append("Leg Programming")
                    }
                    else{
                        let legIndex = workoutInfo.dayWorkouts.firstIndex(of: "Leg Programming");
                        workoutInfo.dayWorkouts.remove(at: legIndex ?? 0);
                        self.legClicked = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(legClicked ? Color.red : Color.green)
                
                Button("Back") {
                    self.backClicked = true
                    if(workoutInfo.dayWorkouts.contains("Back Programming") == false){
                        workoutInfo.dayWorkouts.append("Back Programming")
                    }
                    else{
                        let backIndex = workoutInfo.dayWorkouts.firstIndex(of: "Back Programming");
                        workoutInfo.dayWorkouts.remove(at: backIndex ?? 0);
                        self.backClicked = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(backClicked ? Color.red : Color.green)
                
                Button("Chest") {
                    self.chestClicked = true
                    if(workoutInfo.dayWorkouts.contains("Chest Programming") == false){
                        workoutInfo.dayWorkouts.append("Chest Programming")
                    }
                    else{
                        let chestIndex = workoutInfo.dayWorkouts.firstIndex(of: "Chest Programming");
                        workoutInfo.dayWorkouts.remove(at: chestIndex ?? 0);
                        self.chestClicked = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(chestClicked ? Color.red : Color.green)
                
                Button("Abs") {
                    self.absClicked = true
                    if(workoutInfo.dayWorkouts.contains("Abs Programming") == false){
                        workoutInfo.dayWorkouts.append("Abs Programming")
                    }
                    else{
                        let absIndex = workoutInfo.dayWorkouts.firstIndex(of: "Abs Programming");
                        workoutInfo.dayWorkouts.remove(at: absIndex ?? 0);
                        self.absClicked = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(absClicked ? Color.red : Color.green)
                
            }
        }
        
//        .frame(width: , height: 10000, alignment: .center)

    }
}







