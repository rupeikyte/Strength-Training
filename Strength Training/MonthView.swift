//
//  CalendarStructures.swift
//  Strength Training
//
//  Created by Noel Raehl on 3/27/25.
//  Code used for scaling the size of text in DayCells: https://stackoverflow.com/questions/57035746/how-to-scale-text-to-fit-parent-view-with-swiftui
// Code used for guard let: https://www.hackingwithswift.com/forums/100-days-of-swiftui/guard-let-in-swiftui/24223
// Code for changing background colors https://stackoverflow.com/questions/56437036/swiftui-how-do-i-change-the-background-color-of-a-view
//Code for foreach loops https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
// Code for displaying rectangles as daycells https://www.hackingwithswift.com/quick-start/swiftui/how-to-display-solid-shapes
// Code for using SF Symbols https://www.hackingwithswift.com/articles/237/complete-guide-to-sf-symbols
// Code for joining items from a DS https://stackoverflow.com/questions/64950441/is-it-possible-to-loop-over-an-array-of-text-views-and-display-them
//Code for setting up Navigation Stack: https://stackoverflow.com/questions/73923505/how-to-use-foreach-on-an-array-of-struct-in-swift



import SwiftUI


/// A grouping of days on the homescreen based on the number of days in the current month-year pair.
/// Highlights days that repeat the same muscle group back-to-back in red.
struct MonthView: View {
    @ObservedObject var calendar: WorkoutCalendar
    let daysCalendar = Locale.current.calendar
    @State var month: Int
    @State var year: Int
    var monthNotification: String {
            generateMonthNotification()
        }
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
                        if !monthNotification.isEmpty {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 26))
                                .foregroundColor(.yellow)
                                .help("\(monthNotification)")
                        }
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
                                
                                //The code below adjust for how many weeks there are in the month, and creates the necessary empty cells to maintain the rectangle shape of the calendar
                                ForEach(0..<numOfWeeks, id: \.self) { week in
                                    let dayOfMonth = (week * 7 + dayOfWeek+1) - firstWeekday
                                    if dayOfMonth >= 1 && dayOfMonth <= totalMonthDay,
                                       let date = daysCalendar.date(from: DateComponents(year: year, month: month, day: dayOfMonth)) {
                                        let workoutDay = calendar.workoutDay(forDate: date)
                                        NavigationLink(
                                            destination:
                                                DayView(day: workoutDay, onChange: {calendar.save();calendar.notifyAll()}),
                                            label: {
                                                DayCell(day: workoutDay, calendar: calendar)
                                                    .border(Color.brown, width: 1)
                                                    .overlay(alignment: .bottomTrailing) {
                                                        Text("\(dayOfMonth)")
                                                            .font(.custom("Georgia", size: 20))
                                                            .padding(.trailing, 5)
                                                            .padding(.bottom, 5)
                                                            .minimumScaleFactor(0.01)
                                                    }
                                                    .minimumScaleFactor(0.5)
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
    /// - Returns: Number of calendar Sunday-Saturday weeks covered by the days in the month
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
    
    /// Generates notifications to the user throughout a schedule,
    /// - Returns: String, a message about which requirement is missing in a schedule
    func generateMonthNotification() -> String {
            var notification = ""
            
        let untrainedMuscleGroups = calendar.isEverythingGettingTrained(month: month, year: year)
            let sortedUntrainedGroups = untrainedMuscleGroups.sorted()
            
            if !sortedUntrainedGroups.isEmpty {
                let formattedGroups = sortedUntrainedGroups.joined(separator: ", ")
                notification = "Consider training \(formattedGroups) this month!"
            } else {
                notification = ""
            }
            
            return notification
        }
}

var bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)

/// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    @ObservedObject var day: WorkoutDay
    @ObservedObject var calendar: WorkoutCalendar
    
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
                            .minimumScaleFactor(0.01)
                    }
                }
            }
            if !notifications.isEmpty {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 26))
                    .foregroundColor(.red.opacity(0.75))
                    .position(x: 20, y: 20)
                    .help(notifications.joined(separator: "\n"))
                    .fontWeight(.bold)
            }
        }
    }
    
    /// Generates notifications for users when their schedule does not meet a requirement
    /// - Returns: Array of strings, a message to the user to support them in the making of their schedule
    func generateNotifications() -> [String] {
        let backToBack = calendar.getAllBackToBack()
        let dayOverload = calendar.dayOverload()
        var tempNotifications: [String] = []

        if let muscleGroups = backToBack[day.date] {
            tempNotifications += muscleGroups.map { "You work out \($0) two days in a row!" }
        }

        if dayOverload[day.date] != nil {
            tempNotifications.append("You are working out too many days in a row!")
        }

        return tempNotifications
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






