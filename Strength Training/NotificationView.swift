//
//  NotificationView.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/21/25.
//



import SwiftUI


/// Sidebar showing weekly workout suggestions and issues
struct NotificationView: View {
    var calendar: WorkoutCalendar
    var weekCount: Int
    var body: some View {
//        let weeks = splitDaysIntoWeeks(days: calendar.days, numberOfWeeks: weekCount)
        let weeks: [[WorkoutDay]] = [] // TODO: make this workagain! splitDaysIntoWeeks(days: calendar.days)
        
        ///
       
        
//        calendar.days.keys.contains(where: { $0.year == 2025 && $0.month == 4 && $0.day == 21 })
        
        GeometryReader { geometry in
//
//           let aDate = calendar.days.keys.first(where: { calendar.days[$0]?.dayNumber == index+firstWeekday })
//            let datesText = aDate!.formatted(.dateTime.day())
            
            VStack(spacing: 0) {
                Text("Notifications")
                    .font(.largeTitle)
                    .frame(height: 95)
                    .frame(width: geometry.size.width)
                    .background(Color.brown.opacity(0.2))
                    .border(Color.brown, width: 1)
                
                VStack(spacing: 0) {
                    ForEach(0..<weekCount, id: \.self) { weekIndex in
                        NotificationCell(thisWeeksDays: weeks[weekIndex])
                    }
                }
            }
        }
        .frame(width: 200)
    }
    
    func splitDaysIntoWeeks(days: [WorkoutDay], numberOfWeeks: Int) -> [[WorkoutDay]] {
        var weeks: [[WorkoutDay]] = []
        for weekIndex in 0..<numberOfWeeks {
            let start = weekIndex * 7 + 1
            let end = min(start + 7, days.count)
            if start < end {
                weeks.append(Array(days[start..<end]))
            }
        }
        return weeks
    }
}



/// Tile showing notifications for a corresponding week
///
struct NotificationCell: View {
    var thisWeeksDays: [WorkoutDay]
    
    var bgColor = Color(red: 167/255, green: 192/255, blue: 196/255)
    
    var body: some View {
        ZStack {
            bgColor.opacity(0.5)
            VStack(spacing: 2) {
                ForEach(generateNotifications(), id: \.self) { notification in
                    Text(notification)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(2)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .border(Color.brown, width: 1)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    
    // Creates notifications using the WorkoutEvalutator
    func generateNotifications() -> [String] {
        var notifications: [String] = []
        
        let backToBack = WorkoutEvaluator.getAllBackToBack(in: thisWeeksDays)
        
        for (muscleGroup, streaks) in backToBack {
            for streak in streaks {
                let daysList = streak.sorted().map { dayNumberToWeekdayName(dayNumber: $0) }.joined(separator: ", ")
                notifications.append("\(muscleGroup): \(daysList) (back-to-back)")
            }
        }
        
        if WorkoutEvaluator().dayOverload(in: thisWeeksDays) {
            notifications.append("Overload Week")
        }
        
        return notifications
    }
    
    //Translates the day number of the month to the day of the week
    func dayNumberToWeekdayName(dayNumber: Int) -> String {
        let weekdayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        let weekdayIndex = (dayNumber - 1) % 7
        return weekdayNames[weekdayIndex]
    }
}

