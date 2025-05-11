//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI

/// This is a rectangle that is displayed in a day view. This rectangle contains the specific information for a particular workout. As there are six workouts/muscle groups, there are six different types of daycards, each with specific text about the muscle group workouts, that can be displayed.
struct DayCard: View {
    let bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)
    let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)
    let muscleGroup: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .border(Color.brown, width:2)
            .foregroundStyle(bgBlue.opacity(0.7))
            .overlay(
                VStack(spacing: 0) {
                    Text(muscleGroup)
                        .font(.custom("Georgia", size: 20))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color(white: 0.85))
                        .border(Color.brown, width: 2)
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 15) {
                            ForEach(workouts(for: muscleGroup)) { workout in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(workout.name)
                                        .font(.custom("Georgia", size: 20))
                                        .fontWeight(.bold)
                                    Text(workout.description)
                                        .font(.custom("Georgia", size: 14))
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                })
    }
}

/// The destination that clicking on a day cell showcases. This includes the buttons to add muscle group information to the date, and the corresponding muscle group text held in day card views above.
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
                                        .font(.custom("Georgia", size: 22))
                                        .frame(maxWidth: .infinity, maxHeight: 50)
                                        .border(Color.brown, width:2)
                                        .background(Color(white: 0.85))
                            }
                        }
                    }
                }
            }
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







