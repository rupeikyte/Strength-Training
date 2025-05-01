//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI


//The destination that clicking on a daycell showcases. This includes the buttons to add muscle group information to the day, and the corresponding text from the day of the WorkoutCalendar.

struct DayCard: View {
    
    let bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)
    let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)
    
    let muscleGroup: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .padding(.top, 50)
        
            .border(Color.brown, width:2)
            .foregroundStyle(bgBlue.opacity(0.7))
        
            .overlay(
                VStack(spacing: 50) {
                    ForEach(workouts(for: muscleGroup), id: \.self) { oneWorkout in
                        Text("• \(oneWorkout)")
                            .font(.custom("Georgia", size: 25))
                    }
                })
    }
}

struct DayView: View {
    let dayNumber: Int
    @ObservedObject var calendar: WorkoutCalendar
    @State private var showModificationOptions = false;

let bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)

    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == dayNumber }!
        let groups = muscleGroupNames
        VStack(spacing: 20) {
            
            HStack(spacing:20) {
                ForEach(groups, id: \.self) { group in
                    if calendar.days[index].muscleGroups[group] == true {
                        ZStack{
                            
                            DayCard(muscleGroup: group)
                            
                                .overlay(alignment: .top) {
                                    Text(group)
                                        .font(.custom("Georgia", size: 30))
                                        .frame(maxWidth: .infinity, maxHeight: 50)
                                        .border(Color.brown, width:2)
                                        .background(Color(white: 0.85))
                                        
                                }
                        }
                        
                        .padding(.leading, 60)
                        .padding([.top, .bottom], 80)

                    }
                }
            }
            .padding(.trailing, 60)

                HStack {
                    ForEach(groups, id: \.self) { group in
                        Button {
                            calendar.days[index].muscleGroups[group]!.toggle()
                            calendar.save()
                                
                        } label: {
                            Text(group)
                                
                                .frame(width: 150, height: 60)
                                .font(.custom("Georgia", size: 25))
                        }
                        
                        .padding([.leading, .trailing], 36)
                        .padding(.bottom, 15)
                        .buttonStyle(.borderedProminent)
                        .buttonStyle(PlainButtonStyle())
                        .controlSize(.extraLarge)
                        .tint((calendar.days[index].muscleGroups[group] == true ? Color.red : Color.green))
                    }
                }
                .buttonStyle(.borderedProminent)
                .buttonStyle(PlainButtonStyle())
        }
        .clipShape(Rectangle())

    }
        
}







