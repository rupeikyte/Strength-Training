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
    @State var dayToday = Calendar.current.component(.day, from: Date())
    @State var monthToday = Calendar.current.monthSymbols[Calendar.current.component(.month, from: Date()) - 1]
    @State var yearToday = Calendar.current.component(.year, from: Date())

    var body: some View {
        
        let flaggedDays = WorkoutEvaluator.getAllBackToBack(in: calendar.days)
        ZStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    
                    Text(monthToday.description + " " + yearToday.description)
                        .font(.title)
                        .frame(width: geometry.size.width)
                        .padding(.vertical, 10)
                        .border(Color.brown, width: 0.5)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<7) { day in
                            VStack(spacing: 0) {
                                Text(weekDays[day])
                                    .font(.title)
                                //                                        .background(Color.blue)
                                    .frame(width: geometry.size.width/7)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                    .border(Color.brown, width: 0.5)
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius:5))
                                

                                        ForEach(0..<5) { week in
                                            let index = week * 7 + day
                                            if index < calendar.days.count {
                                                let day = calendar.days[index]
                                        NavigationLink(
                                            destination:
                                                DayView(dayNumber: day.dayNumber, calendar: calendar),
                                            label: {
                                                DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                                    
                                                    .border(Color.brown, width: 0.5)
                                                    .frame(alignment: .bottom)
                                                    .clipShape(RoundedRectangle(cornerRadius:5))
                                                    .overlay(alignment: .bottomTrailing) {
                                                        Text("\(day.dayNumber)")
                                                        
                                                            .font(.title3)
                                                            .padding(.trailing, 5)
                                                            .padding(.bottom, 5)
                                                            
                                                    }
                                                    
                                            })
                                        
                                        }
                                   
                                    }
                                        
                                       
                                .buttonStyle(PlainButtonStyle())
                              
                            }
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
    let bgBlue = Color(red: 121/255, green: 190/255, blue: 242/255)
    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == day.dayNumber }!
        let groups = muscleGroupNames
        
        ZStack {
            bgBlue.opacity(0.2)
            VStack {
                ForEach(groups, id: \.self) { group in
                    if calendar.days[index].muscleGroups[group] == true {
                        Text("•\(group)")
                            .background(RoundedRectangle(cornerRadius: 5)
                                .fill(isFlagged ? Color.red.opacity(0.5) : Color.clear))
                    }
                }
            }
            
        }
        
    }
}









