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
        
        let firstWeekday = getFirstDayOfWeek()
        let totalMonthDay = getLastDayofMonth()
        let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)

        ZStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    
                    Text(calendarTitle())
                        .font(.largeTitle)
                        .frame(width: geometry.size.width)
                        .padding(.vertical, 10)
                        .background(Color(white: 0.85))
                    
                    HStack(spacing: 0) {
                        ForEach(0..<7) { day in
                            VStack(spacing: 0) {
                                Text("\(getAllWeekDays()[day])")
                                    .font(.title)
                                    .frame(width: geometry.size.width/7)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                    .border(Color.brown, width: 1)
                                    .background(bgBrown)
                                    .clipShape(RoundedRectangle(cornerRadius:5))
                                
                    //Three conditionals below account for minimum number of weeks that should be displayed
                                if ((getFirstDayOfWeekReverse()+1) + 21 == totalMonthDay){
                                    ForEach(0..<4) { week in
                                        let index = (week * 7 + day+1) - firstWeekday
                                        let day = calendar.days[index+firstWeekday]
                                        if index >= 1 && index <= (totalMonthDay) {
                                            NavigationLink(
                                                destination:
                                                    DayView(dayNumber: day.dayNumber, calendar: calendar),
                                                label: {
                                                    DayCell(day: day, calendar: calendar)
                                                    
                                                        .border(Color.brown, width: 1)
                                                        .frame(alignment: .bottom)
                                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                                        .overlay(alignment: .bottomTrailing) {
                                                            Text("\(day.dayNumber-firstWeekday)")
                                                                .font(.title3)
                                                                .padding(.trailing, 5)
                                                                .padding(.bottom, 5)
                                                        }
                                                })
                                        } else {
                                            
                                            DayCell(day: day, calendar: calendar)
                                            
                                                .border(Color.brown, width: 1)
                                                .frame(alignment: .bottom)
                                                .clipShape(RoundedRectangle(cornerRadius:5))
                                                .background(Color.brown.opacity(0.5))
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                } else if ((getFirstDayOfWeekReverse()+1) + 28 >= totalMonthDay) {
                                    ForEach(0..<5) { week in
                                        let index = (week * 7 + day+1) - firstWeekday
                                        let day = calendar.days[index+firstWeekday]
                                        if index >= 1 && index <= (totalMonthDay) {
                                            NavigationLink(
                                                destination:
                                                    DayView(dayNumber: day.dayNumber, calendar: calendar),
                                                label: {
                                                    DayCell(day: day, calendar: calendar)
                                                    
                                                        .border(Color.brown, width: 1)
                                                        .frame(alignment: .bottom)
                                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                                        .overlay(alignment: .bottomTrailing) {
                                                            Text("\(day.dayNumber-firstWeekday)")
                                                                .font(.title3)
                                                                .padding(.trailing, 5)
                                                                .padding(.bottom, 5)
                                                        }
                                                })
                                        } else {
                                            
                                            DayCell(day: day, calendar: calendar)
                                            
                                                .border(Color.brown, width: 1)
                                                .frame(alignment: .bottom)
                                                .clipShape(RoundedRectangle(cornerRadius:5))
                                                .background(Color.brown.opacity(0.5))
                                            
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                } else {
                                    ForEach(0..<6) { week in
                                        let index = (week * 7 + day+1) - firstWeekday
                                        let day = calendar.days[index+firstWeekday]
                                        if index >= 1 && index <= (totalMonthDay) {
                                            NavigationLink(
                                                destination:
                                                    DayView(dayNumber: day.dayNumber, calendar: calendar),
                                                label: {
                                                    DayCell(day: day, calendar: calendar)
                                                    
                                                        .border(Color.brown, width: 1)
//                                                        .frame(alignment: .bottom)
                                                        .clipShape(Rectangle())
                                                        .overlay(alignment: .bottomTrailing) {
                                                            Text("\(day.dayNumber-firstWeekday)")
                                                                .font(.title3)
                                                                .padding(.trailing, 5)
                                                                .padding(.bottom, 5)
                                                        }
                                                })
                                        } else {
                                            
                                            DayCell(day: day, calendar: calendar)
                                            
                                                .border(Color.brown, width: 1)
//                                                .frame(alignment: .bottom)
                                                .clipShape(Rectangle())
//                                                .clipShape(RoundedRectangle(cornerRadius:5))
                                            
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
    
    func calendarTitle() -> String {
        let calendar = Locale.current.calendar
        let monthShown = calendar.dateComponents([.year, .month], from: Date())

        return calendar.date(from: monthShown)!
            .formatted(
                .dateTime.month(.wide).year())
    }

    func getFirstDayOfWeek() -> Int {
        let calendar = Locale.current.calendar
        let weekShown = calendar.dateComponents([.year, .month, .weekOfMonth], from: Date())
//        let weekShown = DateComponents(year: 2015, month: 2, weekOfMonth: 1)

        let firstWeekday = calendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        
        return getAllWeekDays().firstIndex(of: firstWeekday)!
        
    }
    
    func getAllWeekDays() -> [String] {
        let calendar = Locale.current.calendar
        var allWeekDays: [String] = []
        for i in 0...6 {
            allWeekDays.append(calendar.weekdaySymbols[i])
        }
        
        return allWeekDays
    }
    
    
    func getLastDayofMonth() -> Int {
        let calendar = Locale.current.calendar

        let monthShown = calendar.dateComponents([.year, .month], from: Date())
//        let monthShown = DateComponents(year: 2015, month: 2)
        
        
        let lastDay = calendar.range(of: .day, in: .month, for: calendar.date(from: monthShown)!)!
        return lastDay.startIndex.distance(to: lastDay.endIndex)
    }
    
    func getFirstDayOfWeekReverse() -> Int {
      
        let calendar = Locale.current.calendar
        
        let weekShown = calendar.dateComponents([.year, .month, .weekOfMonth], from: Date())
//        let weekShown = DateComponents(year: 2015, month: 2, weekOfMonth: 1)

        let firstWeekday = calendar.date(from: weekShown)!
            .formatted(
                .dateTime.weekday(.wide))
        
        var allWeekDays: [String] = []
        for i in 0...6 {
            allWeekDays.append(calendar.weekdaySymbols[i])
        }
        
        let reversedDays = Array(allWeekDays.reversed())
            
        return reversedDays.firstIndex(of: firstWeekday)!
    }
    
    func getNextMonth() -> Date {
        let calendar = Locale.current.calendar
        var dateComponents = DateComponents()
        dateComponents.month = 1
        return calendar.date(byAdding: dateComponents, to: Date())!
        
    }
    
    func getNumberOfWeeks() -> Int {
        let firstWeekday = getFirstDayOfWeek()
        let totalDays = getLastDayofMonth()
        return (firstWeekday + totalDays + 6) / 7
    }
}


// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    var day: WorkoutDay
    @ObservedObject var calendar: WorkoutCalendar
    var bgBlue = Color(hue: 154/360, saturation: 0.3, brightness: 0.8)
//    let bgBlue = Color(red: 167/255, green: 192/255, blue: 196/255)
    var body: some View {
        let index = calendar.days.firstIndex { $0.dayNumber == day.dayNumber }!
        let groups = muscleGroupNames
        
        ZStack {
            bgBlue.opacity(0.7)
            VStack {
                ForEach(groups, id: \.self) { group in
                    if calendar.days[index].muscleGroups[group] == true {
                        Text("•\(group)")
                            .background(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
        }
    }
}


//Index first vstack --> Find the first Hstack that is associated index of firstWeekday's int --> put associated dayNumber to be the origin (1) --> loop through remaining 'day/daynumbers', incrementing, stopping at maxDayNum








