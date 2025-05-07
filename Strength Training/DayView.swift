//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI


///The destination that clicking on a daycell showcases. This includes the buttons to add muscle group information to the day, and the corresponding text from the day of the WorkoutCalendar.
struct DayCard: View {
    let bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)
    let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)
    let muscleGroup: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .border(Color.brown, width:2)
            .foregroundStyle(bgBlue.opacity(0.7))
            .overlay(
                VStack(spacing: 50) {
                    ForEach(workouts(for: muscleGroup), id: \.self) { oneWorkout in
                        Text("\(oneWorkout)")
                            .font(.custom("Georgia", size: 25))
                    }
                    .padding([.leading, .trailing], 5)
                    

                })
    }
}

struct DayView: View {
    let bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)

    @ObservedObject var day: WorkoutDay
    var onChange: () -> Void
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack(spacing:20) {
                ForEach(muscleGroupNames, id: \.self) { group in
                    if day.muscleGroups.contains(group) {
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
//                        .padding(.leading, 10)
//                        .padding([.top, .bottom], 10)
                    }
                }
            }
//            .padding(.trailing, 10)
            
            HStack {
                ForEach(muscleGroupNames, id: \.self) { group in
                    Button(action: {
                        if day.muscleGroups.contains(group) {
                            day.muscleGroups.remove(group)
                        } else {
                            day.muscleGroups.insert(group)
                        }
                        onChange()
                    }) {
                        Text(group)
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .font(.custom("Georgia", size: 25))
                    }
                    
                    .padding([.leading, .trailing], 15)
                    .padding(.bottom, 15)
                    .buttonStyle(.borderedProminent)
                    .buttonStyle(PlainButtonStyle())
                    .tint(day.muscleGroups.contains(group) ? Color.red : Color.green)
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonStyle(PlainButtonStyle())
        }
        .padding([.leading, .trailing, .top, .bottom], 10)


    }
        
}







