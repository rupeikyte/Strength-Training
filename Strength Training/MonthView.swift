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
    
    var body: some View {
        
        let flaggedDays = WorkoutEvaluator.getAllBackToBack(in: calendar.days)
        let firstWeekday = getFirstDayOfWeek()
        let totalMonthDay = getLastDayofMonth()
        let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)
        
        ZStack {
            GeometryReader { geometry in
                
                VStack(spacing: 0) {
                    //The horizontal view of the left button, next to a month and year,
                    //next to a right button. The left and right buttons are for scrolling
                    //through months
                    HStack {
                        Button {
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.largeTitle)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Text(calendarTitle())
                            .font(.custom("Georgia", size: 35))
                        
                        Button {
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.largeTitle)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .frame(width: geometry.size.width)
                    .padding(.vertical, 10)
                    .background(Color(white: 0.85))
                    
                    HStack(spacing: 0) {
                        ForEach(0..<7) { day in
                            VStack(spacing: 0) {
                                Text("\(getAllWeekDays()[day])")
                                    .font(.custom("Georgia", size: 25))
                                    .frame(width: geometry.size.width/7)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                    .border(Color.brown, width: 1)
                                    .background(bgBrown)
                                
                                //Three conditionals below account for minimum number of weeks that should be displayed
                                //This first conditional checks if there are 28 days in the month,
                                //and the first day starts on sunday. Therefore, four weeks
                                //will be displayed.
                                if ((getFirstDayOfWeekReverse()) + 21 == totalMonthDay){
                                    ForEach(0..<4) { week in
                                        let index = (week * 7 + day+1) - firstWeekday
                                        let day = calendar.days[index+firstWeekday]
                                        if index >= 1 && index <= (totalMonthDay) {
                                            NavigationLink(
                                                destination:
                                                    DayView(dayNumber: day.dayNumber, calendar: calendar),
                                                label: {
                                                    DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                                        .border(Color.brown, width: 1)
                                                        .overlay(alignment: .bottomTrailing) {
                                                            Text("\(day.dayNumber-firstWeekday)")
                                                                .font(.custom("Georgia", size: 20))
                                                                .padding(.trailing, 5)
                                                                .padding(.bottom, 5)
                                                        }
                                                })
                                        } else {
                                            
                                            DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                                .border(Color.brown, width: 1)
                                                .background(Color.brown.opacity(0.5))
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    //Second conditional checks if there are less days in the current month than
                                    //in four weeks (28 days) plus whichever day is the first
                                    //day of the week this current month.
                                    //Therefore, 5 weeks is sufficient to display all days in the month.
                                } else if ((getFirstDayOfWeekReverse()) + 28 >= totalMonthDay) {
                                    ForEach(0..<5) { week in
                                        let index = (week * 7 + day+1) - firstWeekday
                                        let day = calendar.days[index+firstWeekday]
                                        if index >= 1 && index <= (totalMonthDay) {
                                            NavigationLink(
                                                destination:
                                                    DayView(dayNumber: day.dayNumber, calendar: calendar),
                                                label: {
                                                    DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                                        .border(Color.brown, width: 1)
                                                        .overlay(alignment: .bottomTrailing) {
                                                            Text("\(day.dayNumber-firstWeekday)")
                                                                .font(.custom("Georgia", size: 20))
                                                                .padding(.trailing, 5)
                                                                .padding(.bottom, 5)
                                                        }
                                                })
                                            
                                        } else {
                                            
                                            DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                                .border(Color.brown, width: 1)
                                                .background(Color.brown.opacity(0.5))
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    //
                                    //Third conditional checks is used if there are more days in the current month than
                                    //in four weeks (28 days) plus whichever day is the first
                                    //day of the week this month. Therefore, 6 weeks must be displayed to show every
                                    // day in the month.
                                } else {
                                    ForEach(0..<6) { week in
                                        let index = (week * 7 + day+1) - firstWeekday
                                        let day = calendar.days[index+firstWeekday]
                                        if index >= 1 && index <= (totalMonthDay) {
                                            NavigationLink(
                                                destination:
                                                    DayView(dayNumber: day.dayNumber, calendar: calendar),
                                                label: {
                                                    
                                                    DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                                    
                                                        .border(Color.brown, width: 1)
                                                        .overlay(alignment: .bottomTrailing) {
                                                            Text("\(day.dayNumber-firstWeekday)")
                                                                .font(.custom("Georgia", size: 20))
                                                                .padding(.trailing, 5)
                                                                .padding(.bottom, 5)
                                                        }
                                                })
                                        } else {
                                            DayCell(day: day, calendar: calendar, isFlagged: flaggedDays.contains(day.dayNumber))
                                                .border(Color.brown, width: 1)
                                                .background(Color.brown.opacity(0.5))
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                    .border(Color.brown, width: 2)
                }
            }
        }
    }
    
    //Extracts the current month and year as a string so it can be displayed on the homescreen
    func calendarTitle() -> String {
        let calendar = Locale.current.calendar
        let monthShown = calendar.dateComponents([.year, .month], from: Date())
        return calendar.date(from: monthShown)!
            .formatted(
                .dateTime.month(.wide).year())
    }
    
    //Determines the first day of the week of the current month and year. This is used for calendar calculations
    //so that the current month and year are displayed accurately on the homescreen.
    func getFirstDayOfWeek() -> Int {
        let calendar = Locale.current.calendar
        let weekShown = calendar.dateComponents([.year, .month, .weekOfMonth], from: Date())
        //let weekShown = DateComponents(year: 2015, month: 2, weekOfMonth: 1)
        let firstWeekday = calendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        return getAllWeekDays().firstIndex(of: firstWeekday)!
    }
    
    //Holds all the days of the week
    func getAllWeekDays() -> [String] {
        let calendar = Locale.current.calendar
        var allWeekDays: [String] = []
        for i in 0...6 {
            allWeekDays.append(calendar.weekdaySymbols[i])
        }
        return allWeekDays
    }
    
    //Determines how many total days there are in the current month and year.
    func getLastDayofMonth() -> Int {
        let calendar = Locale.current.calendar
        let monthShown = calendar.dateComponents([.year, .month], from: Date())
        //        let monthShown = DateComponents(year: 2015, month: 2)
        let lastDay = calendar.range(of: .day, in: .month, for: calendar.date(from: monthShown)!)!
        return lastDay.startIndex.distance(to: lastDay.endIndex)
    }
    
    //Determines the first day of the week of the current month and year.
    //However, this reverses the order of the days of the week, so that the first day displayed on the calendar,
    //sunday, is the number "7", and the last day, saturday, is "1." This helps with calendar calculations.
    func getFirstDayOfWeekReverse() -> Int {
        let calendar = Locale.current.calendar
        let weekShown = calendar.dateComponents([.year, .month, .weekOfMonth], from: Date())
        //        let weekShown = DateComponents(year: 2015, month: 2, weekOfMonth: 1)
        let firstWeekday = calendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        let reversedDays = Array(getAllWeekDays().reversed())
        return (reversedDays.firstIndex(of: firstWeekday)!+1)
    }
    
//    func getNextMonth() -> Date {
//        let calendar = Locale.current.calendar
//        var dateComponents = DateComponents()
//        dateComponents.month = 1
//        return calendar.date(byAdding: dateComponents, to: Date())!
//        
//    }
}

// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    var day: WorkoutDay
    @ObservedObject var calendar: WorkoutCalendar
    var isFlagged: Bool
    var bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)
    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == day.dayNumber }!
        let groups = muscleGroupNames
        
        ZStack {
            bgBlue.opacity(0.7)
            VStack {
                ForEach(groups, id: \.self) { group in
                    if calendar.days[index].muscleGroups[group] == true {
                        
                        Text("•\(group)")
                            .font(.custom("Georgia", size: 20))
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 5)
                .fill(isFlagged ? Color.red.opacity(0.5) : Color.clear))
        }
    }
}


//Index first vstack --> Find the first Hstack that is associated index of firstWeekday's int --> put associated dayNumber to be the origin (1) --> loop through remaining 'day/daynumbers', incrementing, stopping at maxDayNum








