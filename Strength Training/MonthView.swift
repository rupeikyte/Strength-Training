//
//  CalendarStructures.swift
//  Strength Training
//
//  Created by Noel Raehl on 3/27/25.
//

import SwiftUI


/// A grouping of days on the homescreen based on the number of days in the current month-year pair.
/// Highlights days that repeat the same muscle group back-to-back in red.
struct MonthView: View {
    
    var calendar: WorkoutCalendar
    let daysCalendar = Locale.current.calendar
    
    @State var month: Int
    @State var year: Int
    
    var body: some View {
        
        let firstWeekday = getFirstDayOfWeek()
        let totalMonthDay = getLastDayofMonth()
        let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)
        @State var numOfWeeks = getNumberOfWeeks()
        
        ZStack {
            GeometryReader { geometry in
                
                VStack(spacing: 0) {
                    //The horizontal view of the left button, next to a month and year,
                    //next to a right button. The left and right buttons are for scrolling
                    //through months
                    HStack {
                        
                        Button {
                            if month == 1 {
                                month = 12
                                year -= 1
                            }
                            else {
                                month -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.largeTitle)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Text(calendarTitle(for: month, year: year))
                            .font(.custom("Georgia", size: 35))
                        
                        Button {
                            if month == 12 {
                                month = 1
                                year += 1
                            } else {
                                month += 1
                            }
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
                        ForEach(0..<7) { dayOfWeek in
                            VStack(spacing: 0) {
                                Text("\(getAllWeekDays()[dayOfWeek])")
                                    .font(.custom("Georgia", size: 25))
                                    .frame(width: geometry.size.width/7, height: 30)
                                    .truncationMode(.tail)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                    .border(Color.brown, width: 1)
                                    .background(bgBrown)
                                
                                ///The code below adjust for how many weeks there are in the month, and creates the necessary empty cells to maintain the rectangle shape of the calendar
                                ForEach(0..<numOfWeeks, id: \.self) { week in
                                    
                                    let dayOfMonth = (week * 7 + dayOfWeek+1) - firstWeekday
                                    if dayOfMonth >= 1 && dayOfMonth <= totalMonthDay,
                                       let date = daysCalendar.date(from: DateComponents(year: year, month: month, day: dayOfMonth)) {
                                        let workoutDay = calendar.workoutDay(forDate: date)
                                        NavigationLink(
                                            destination:
                                                DayView(day: workoutDay, onChange: { calendar.save() }),
                                            
                                            label: {
                                                DayCell(day: workoutDay, calendar: calendar)
                                                    .border(Color.brown, width: 1)
                                                    .overlay(alignment: .bottomTrailing) {
                                                        Text("\(dayOfMonth)")
                                                            .font(.custom("Georgia", size: 20))
                                                            .padding(.trailing, 5)
                                                            .padding(.bottom, 5)
                                                    }
                                            })
                                    } else {
                                        EmptyCell()
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .border(Color.brown, width: 2)
                }
            }
        }
    }
    
    /// extracts the current month and year as a string so it can be displayed on the homescreen
    /// - Parameters:
    ///   - month: integer that gives us month
    ///   - year: integer that gives us corresponding year
    /// - Returns: string of the month and year
    func calendarTitle(for month: Int, year: Int) -> String {
        let components = DateComponents(year: year, month: month)
        guard let date = daysCalendar
            .date(from: components) else { return "" }
        return date
            .formatted(
                .dateTime.month(.wide).year())
    }
    
    /// Determines the first day of the week of the current month and year. This is used for calendar calculations
    /// so that the current month and year are displayed accurately on the homescreen.
    /// - Returns: Integer corresponding to first day of the week
    func getFirstDayOfWeek() -> Int {
        let weekShown = DateComponents(year: year, month: month, weekOfMonth: 1)
        let firstWeekday = daysCalendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        return getAllWeekDays().firstIndex(of: firstWeekday)!
    }
    
    /// Holds all the days of the week
    /// - Returns: array of strings, the days of the week
    func getAllWeekDays() -> [String] {
        var allWeekDays: [String] = []
        for i in 0...6 {
            allWeekDays.append(daysCalendar.weekdaySymbols[i])
        }
        return allWeekDays
    }
    
    /// Determines how many total days there are in the current month and year.
    /// - Returns: Integer corresponding to last day of the month
    func getLastDayofMonth() -> Int {
        let monthShown = DateComponents(year: year, month: month)
        let lastDay = daysCalendar.range(of: .day, in: .month, for: daysCalendar.date(from: monthShown)!)!
        return lastDay.startIndex.distance(to: lastDay.endIndex)
    }
    
    /// Determines the first day of the week of the current month and year. So that the first day displayed on the calendar,
    /// sunday, is "7", and the last day, saturday, is "1." This helps with calendar calculations.
    /// - Returns: Integer for the first day of the week of current month and year
    func getFirstDayOfWeekReverse() -> Int {
        let weekShown = DateComponents(year: year, month: month, weekOfMonth: 1)
        let firstWeekday = daysCalendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        let reversedDays = Array(getAllWeekDays().reversed())
        return (reversedDays.firstIndex(of: firstWeekday)!+1)
    }
    
    ///Helper function to get the number of weeks for each month
    /// - Returns: Number of calendar weeks Sunday-Saturday weeks covered by the days in the month
    func getNumberOfWeeks() -> Int {
        let firstWeekday = getFirstDayOfWeekReverse()
        let totalDays = getLastDayofMonth()
        
        if (firstWeekday + 21 == totalDays) {
            return 4
        } else if (firstWeekday + 28 >= totalDays) {
            return 5
        } else {
            return 6
        }
    }
}

var bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)

/// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    @ObservedObject var day: WorkoutDay
    var calendar: WorkoutCalendar
    
    var notifications: [String] {
        generateNotifications()
    }
    
    var body: some View {
        ZStack {
            bgBlue.opacity(0.7)
            VStack {
                ForEach(muscleGroupNames, id: \.self) { group in
                    if day.muscleGroups.contains(group) {
                        Text("\(group)")
                            .font(.custom("Georgia", size: 20))
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 5)
                .fill( Color.green.opacity(0.5) ))
            
            if !notifications.isEmpty {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                    .position(x: 15, y: 15)
                    .help(notifications.joined(separator: "\n"))
            }
        }
    }
    
//    TODO: remove this test func
//    func generateNotifications() -> [String] {
//        return ["MEssage 1", "Message 2", "Message 3"]
//        //    return []
//    }
    
    
    func generateNotifications() -> [String] {
        let allDays = calendar.getAllDays()
        let backToBack = WorkoutEvaluator.getAllBackToBack(in: Array(allDays.values))

        if let muscleGroups = backToBack[day.date] {
            return muscleGroups.map { "\($0) is programmed on too many days in a row!" }
        } else {
            return []
        }
    }
}

///The content of an individual rectangle that does not correspond to a day on our calendar.
struct EmptyCell: View {
    
    var body: some View {
        ZStack {
            bgBlue.opacity(0.7)
        }
        .border(Color.brown, width: 1)
        .background(Color.brown.opacity(0.5))
    }
}






