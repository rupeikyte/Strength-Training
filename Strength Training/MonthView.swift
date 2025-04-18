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
    
    @State var month: Int
    @State var year: Int
    
    
//    let weekDays: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
//    var dayToday = Calendar.current.component(.day, from: Date())
//    @State var monthToday = Calendar.current.monthSymbols[Calendar.current.component(.month, from: Date()) - 1]
//    @State var yearToday = Calendar.current.component(.year, from: Date())
//    var firstWeekday = Calendar.current.firstWeekday
//    var firstMonthDay = Calendar.current.component(.weekday, from: Date())-1
//    var monthDays = Calendar.current.component(.day, from: Date())
//locale calendar
    //datecomponents, date formatters
    //date().formatted
    //date object for month and year, Date formatted
    //put in function for calendarTitle
    
    
    var body: some View {
        
        let flaggedDays = WorkoutEvaluator.getAllBackToBack(in: calendar.days)
        ZStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    
                    Text(
                        calendarTitle()
//                        "\(monthToday) \(yearToday) \(dayToday)"
//                        monthToday.description + " " + yearToday.description
//                        + " " + firstWeekday.description + " " + firstMonthDay.description + " " + monthDays.description + " " + dayToday.description
                    )
                        .font(.largeTitle)
                        .frame(width: geometry.size.width)
                        .padding(.vertical, 10)
                        .border(Color.brown, width: 0.5)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<7) { day in
                            VStack(spacing: 0) {
                                Text("\(getFirstDayOfWeek())")
                                    .font(.title)
                                    .frame(width: geometry.size.width/7)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                    .border(Color.brown, width: 0.5)
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius:5))
                                

                                        ForEach(0..<5) { week in
                                            //first and last day here
                                            
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
    
    func calendarTitle() -> String {
        let calendar = Locale.current.calendar
        let monthShown = calendar.dateComponents([.year, .month], from: Date())

        return calendar.date(from: monthShown)!
            .formatted(
                .dateTime.month(.wide).year())

    }

    func getFirstDayOfWeek() -> String {
        let calendar = Locale.current.calendar
        let weekShown = calendar.dateComponents([.year, .month, .weekOfMonth], from: Date())
       
     
        return calendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide)
            )
    }
    
    func getLastDayofMonth() -> Int {
        let calendar = Locale.current.calendar

        let monthShown = calendar.dateComponents([.year, .month], from: Date())
        let lastDay = calendar.range(of: .day, in: .month, for: calendar.date(from: monthShown)!)!
        return lastDay.startIndex.distance(to: lastDay.endIndex)
    }
}


// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    var day: WorkoutDay
    @ObservedObject var calendar: WorkoutCalendar
    var isFlagged: Bool
//    let bgBlue = Color(red: 121/255, green: 190/255, blue: 242/255)
    let bgBlue = Color(red: 167/255, green: 192/255, blue: 196/255)
    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == day.dayNumber }!
        let groups = muscleGroupNames
        
        ZStack {
            bgBlue.opacity(0.5)
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


//Index first vstack --> Find the first Hstack that is associated index of firstWeekday's int --> put associated dayNumber to be the origin (1) --> loop through remaining 'day/daynumbers', incrementing, stopping at maxDayNum







