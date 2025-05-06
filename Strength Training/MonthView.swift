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
    
    @ObservedObject var calendar: WorkoutCalendar
    let daysCalendar = Locale.current.calendar
    
    @State var month: Int
    @State var year: Int
    
    var body: some View {
        
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
                                    .frame(width: geometry.size.width/7)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                    .border(Color.brown, width: 1)
                                    .background(bgBrown)
                                
                                //Three conditionals below account for minimum number of weeks that should be displayed
                                //This first conditional checks if there are 28 days in the month,
                                //and the first day starts on sunday. Therefore, four weeks
                                //will be displayed.
//
                                ForEach(0..<6) { week in
                                    let dayOfMonth = (week * 7 + dayOfWeek+1) - firstWeekday
                                    if dayOfMonth >= 1 && dayOfMonth <= totalMonthDay,
                                       let date = daysCalendar.date(from: DateComponents(year: year, month: month, day: dayOfMonth))
                                    {
                                       
                                        NavigationLink(
                                            destination:
                                                DayView(calendar: calendar, date: date),
                                                
                                            label: {

                                                DayCell(calendar: calendar, date: date)
                                                    .border(Color.brown, width: 1)
                                                    .overlay(alignment: .bottomTrailing) {
                                                        Text("\(dayOfMonth)")
                                                            .font(.custom("Georgia", size: 20))
                                                            .padding(.trailing, 5)
                                                            .padding(.bottom, 5)
                                                    }
                                            })
//
                                    } else {
                                        emptyCell(calendar: calendar)
                                        
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
    
    
    ///extracts the current month and year as a string so it can be displayed on the homescreen
    func calendarTitle(for month: Int, year: Int) -> String {
        let components = DateComponents(year: year, month: month)
        guard let date = daysCalendar
            .date(from: components) else { return "" }
        return date
            .formatted(
                .dateTime.month(.wide).year())
    }
    
    //Determines the first day of the week of the current month and year. This is used for calendar calculations
    //so that the current month and year are displayed accurately on the homescreen.
    func getFirstDayOfWeek() -> Int {
        let weekShown = DateComponents(year: year, month: month, weekOfMonth: 1)
//        let weekShown = daysCalendar.dateComponents([.year, .month, .weekOfMonth], from: Date())
        //let weekShown = DateComponents(year: 2015, month: 2, weekOfMonth: 1)
        let firstWeekday = daysCalendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        return getAllWeekDays().firstIndex(of: firstWeekday)!
    }
    
    //Holds all the days of the week
    func getAllWeekDays() -> [String] {
        var allWeekDays: [String] = []
        for i in 0...6 {
            allWeekDays.append(daysCalendar.weekdaySymbols[i])
        }
        return allWeekDays
    }
    
    //Determines how many total days there are in the current month and year.
    func getLastDayofMonth() -> Int {
        let monthShown = DateComponents(year: year, month: month)

        //        let monthShown = DateComponents(year: 2015, month: 2)
        let lastDay = daysCalendar.range(of: .day, in: .month, for: daysCalendar.date(from: monthShown)!)!
        return lastDay.startIndex.distance(to: lastDay.endIndex)
    }
    
    //Determines the first day of the week of the current month and year. So that the first day displayed on the calendar,
    //sunday, is "7", and the last day, saturday, is "1." This helps with calendar calculations.
    func getFirstDayOfWeekReverse() -> Int {
//        let weekShown = daysCalendar.dateComponents([.year, .month, .weekOfMonth], from: Date())
        let weekShown = DateComponents(year: year, month: month, weekOfMonth: 1)

        //        let weekShown = DateComponents(year: 2015, month: 2, weekOfMonth: 1)
        let firstWeekday = daysCalendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        let reversedDays = Array(getAllWeekDays().reversed())
        return (reversedDays.firstIndex(of: firstWeekday)!+1)
    }
    
    
    func getNumberOfWeeks() -> Int {
        let firstWeekday = getFirstDayOfWeek()
        let totalDays = getLastDayofMonth()
        return (firstWeekday + totalDays + 6) / 7
    }
}
    

// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    @ObservedObject var calendar: WorkoutCalendar
    var date: Date?
    
    var day: WorkoutDay? {
        guard let date else {
            return nil
        }
        return calendar.workoutDay(forDate: date)
    }

    var bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)
    var body: some View {
        ZStack {
            bgBlue.opacity(0.7)
            VStack {
                ForEach(muscleGroupNames, id: \.self) { group in
                    if day?.muscleGroups.contains(group) ?? false {
                        Text("\(group)")
                            .font(.custom("Georgia", size: 20))
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 5)
                .fill( Color.green.opacity(0.5) ))
        }
    }
}

struct emptyCell: View {
    @ObservedObject var calendar: WorkoutCalendar
    
    var body: some View {
        DayCell(calendar: calendar, date: nil)
            .border(Color.brown, width: 1)
            .background(Color.brown.opacity(0.5))
    }
}







