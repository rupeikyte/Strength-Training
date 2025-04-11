//
//  DayView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/27/25.
//

import SwiftUI


//The destination that clicking on a daycell showcases. This includes the buttons to add muscle group information to the day, and the corresponding text from the day of the WorkoutCalendar.

struct DayView: View {
    let dayNumber: Int
    @ObservedObject var calendar: WorkoutCalendar
    
    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == dayNumber }!
        let groups = muscleGroupNames
        
        VStack(spacing: 20) {
            ForEach(groups, id: \.self) { group in
                if calendar.days[index].muscleGroups[group] == true {
                    Text("\(group) Programming")
                }
            }
            
            HStack {
                ForEach(groups, id: \.self) { group in
                    Button(group) {
                        calendar.days[index].muscleGroups[group]?.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(calendar.days[index].muscleGroups[group] == true ? .red : .green)
                }
            }
        }
    }
}







