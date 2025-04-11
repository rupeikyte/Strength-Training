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
    
    var body: some View {
        let flaggedDays = WorkoutManager.getAllBackToBack(in: calendar.days)
        
        Text("Schedule")
            .font(.title)
        
        VStack(spacing: 10) {
            ForEach(0..<6) { week in
                HStack(spacing: 10) {
                    ForEach(0..<7) { day in
                        let index = week * 7 + day
                        if index < calendar.days.count {
                            let day = calendar.days[index]
                            DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                        }
                    }
                }
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
        NavigationLink(
            destination: DayView(dayNumber: day.dayNumber, calendar: calendar)
        ) {
            Text("\(day.dayNumber)")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(isFlagged ? Color.red : Color.gray)
                )
        }
    }
}









