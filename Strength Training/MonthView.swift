//
//  CalendarStructures.swift
//  Strength Training
//
//  Created by Noel Raehl on 3/27/25.
//

import SwiftUI


// A 5x6 grouping of days/rectangles on the homescreen. Also sets the days's daynumber appropriately.
// Highlights days that repeat the same muscle group back-to-back in red.
struct MonthView: View {
    @ObservedObject var calendar: WorkoutCalendar
    let weekDays: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        let flaggedDays = WorkoutManager.getAllBackToBack(in: calendar.days)
        VStack(spacing: 0) {
            
            Text("Schedule")
                .font(.title)
                .border(Color.black, width: 0.5)
//            HStack {
//                ForEach(weekDays, id: \.self) { weekDay in
//                    Text(weekDay)
//                        .font(.title)
//                }
//            }
            
            HStack(spacing: 0){
                ForEach(0..<7) { day in
                    VStack(spacing: 0) {
                        Text(weekDays[day])
                                .font(.title)

                        ForEach(0..<5) { week in
                            let index = week * 7 + day
                            if index < calendar.days.count {
                                let day = calendar.days[index]
                                
                                DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                    .border(Color.black, width: 0.5)
                            }
                            
                        }
                        
                    }
                    
                }
                Spacer()
            }
        }
    }
        
}


// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    var day: WorkoutDay
    @ObservedObject var calendar: WorkoutCalendar
    var isFlagged: Bool
        
    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == day.dayNumber }!
        let groups = muscleGroupNames
        
        NavigationLink(
            destination:
                DayView(dayNumber: day.dayNumber, calendar: calendar),
                
                label: {
                    
                    VStack {
                        Text("\(day.dayNumber)")
                        
                        ForEach(groups, id: \.self) { group in
                            if calendar.days[index].muscleGroups[group] == true {
                                Text("\(group) Programming")
                                
                            }
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 5)
                        .fill(isFlagged ? Color.red : Color.white))
                })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}









