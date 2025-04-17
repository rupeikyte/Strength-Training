//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI


//The destination that clicking on a daycell showcases. This includes the buttons to add muscle group information to the day, and the corresponding text from the day of the WorkoutCalendar.

struct DayCard: View {
    let bgBlue = Color(red: 121/255, green: 190/255, blue: 242/255)

    @State var cycleWorkout: [String] = ["bicep curl", "plank", "other specific workout"]
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .padding(.top, 50)

            .border(Color.brown, width:1)
            .foregroundStyle(bgBlue.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius:20))

            .overlay(
                VStack(spacing: 50) {
                    ForEach(cycleWorkout, id: \.self) { oneWorkout in
                        Text("•" + oneWorkout)
                            .font(.title)
                    }
                }
            )
    }
}


struct DayView: View {
    let dayNumber: Int
    @ObservedObject var calendar: WorkoutCalendar
    @State private var showModificationOptions = false;

    let bgBlue = Color(red: 121/255, green: 190/255, blue: 242/255)

    
    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == dayNumber }!
        let groups = muscleGroupNames
        VStack(spacing: 20) {
            
            HStack(spacing:20) {
                ForEach(groups, id: \.self) { group in
                    if calendar.days[index].muscleGroups[group] == true {
                        ZStack{
                            
                            DayCard()
                            
                                .overlay(alignment: .top) {
                                    Text(group)
                                        .fontDesign(.rounded)
                                        .font(.title)
                                        .frame(maxWidth: .infinity, maxHeight: 50)
                                        .border(Color.brown, width:1)
                                        .background(Color.gray.opacity(0.2))
                                        
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                }
                        }
                        .padding(.leading, 60)
                        .padding([.top, .bottom], 80)

//
                    }
                }
                

            }
            .padding(.trailing, 60)
            
            

            if(!showModificationOptions){
                Button {
                    showModificationOptions = true;
                } label: {
                    Text("Do you want to modify?")
                        .font(.largeTitle)
                        .frame(height: 60)
                        .fontDesign(.rounded)

                }
                .padding(.bottom, 15)
                .buttonStyle(.borderedProminent)
                .buttonStyle(PlainButtonStyle())
                .controlSize(.extraLarge)
//                .offset(x: 10, y: 10)
//                .background(bgBlue.opacity(0.2))

//                .tint(Color.white)
                .tint(bgBlue.opacity(0.2))
                
            }
                
            else{
                HStack {
                    ForEach(groups, id: \.self) { group in
                        Button {
                            calendar.days[index].muscleGroups[group]?.toggle()
                                
                        } label: {
                            Text(group)
                                .font(.largeTitle)
                                .frame(width: 150, height: 60)
                                .fontDesign(.rounded)
                        
                        }
                        
                        .padding([.leading, .trailing], 36)
                        .padding(.bottom, 15)
                        .buttonStyle(.borderedProminent)
                        .buttonStyle(PlainButtonStyle())
                        .controlSize(.extraLarge)
                        .tint((calendar.days[index].muscleGroups[group] == true ? (.red.opacity(0.1)) : (.green.opacity(0.1))))
//                        .offset(x: 10, y: 10)

                    }
                }
            }
        }
    }
        
}







