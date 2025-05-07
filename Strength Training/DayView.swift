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
            .padding(.top, 50)
            .border(Color.brown, width:2)
            .foregroundStyle(bgBlue.opacity(0.7))
            .overlay(
                VStack(spacing: 50) {
                    ForEach(workouts(for: muscleGroup), id: \.self) { oneWorkout in
                        Text("\(oneWorkout)")
                            .font(.custom("Georgia", size: 25))
                    }
                    .padding([.leading, .trailing, .top, .bottom], 0)
                    

                })
    }
}

struct DayView: View {
    @ObservedObject var calendar: WorkoutCalendar
    var date: Date?

    let bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)

    var day: WorkoutDay? {
        guard let date else {
            return nil
        }
        return calendar.workoutDay(forDate: date)
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack(spacing:20) {
                ForEach(muscleGroupNames, id: \.self) { group in
                    if day?.muscleGroups.contains(group) == false {
                        
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
                        .padding(.leading, 10)
                        .padding([.top, .bottom], 20)
                    }
                }
            }
            .padding(.trailing, 10)
            
            HStack {
                ForEach(muscleGroupNames, id: \.self) { group in
                    Button(action: {
                        day!.muscleGroups.insert(group)
                        
                        print(day!.muscleGroups)
                    }) {
                        Text(group)
                    }
                
                           
//                    Button {
//                        
////                        day!.muscleGroups.insert(group).inserted.toggle()
////                        day?.self.muscleGroups.update(with: group)
//                        day!.self.muscleGroups == ["hi"]
//
//                        print(day!.self.muscleGroups )
//                        
//                        //                            calendar.days.values[index].muscleGroups[group]!.toggle()
//                        //                            calendar.save()
//                        //                            DayCard(muscleGroup: group)
//                        
//                    } label: {
//                        Text(group)
//                        
//                        //                                .frame(width: 150, height: 60)
//                            .frame(maxWidth: .infinity, minHeight: 60)
//                        
//                            .font(.custom("Georgia", size: 25))
//                    }
                    
                    .padding([.leading, .trailing], 10)
                    .padding(.bottom, 15)
                    .buttonStyle(.borderedProminent)
                    .buttonStyle(PlainButtonStyle())
                    //                        .tint((day.muscleGroups[group] == true ? Color.red : Color.green))
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonStyle(PlainButtonStyle())
        }
        //.clipShape(Rectangle())

    }
        
}







