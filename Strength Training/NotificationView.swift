//
//  NotificationView.swift
//  Strength Training
//
//  Created by Noel Raehl on 4/21/25.
//



import SwiftUI



/// Sidebar showing weekly workout suggestions and issues
///
struct NotificationView: View {
    @ObservedObject var calendar: WorkoutCalendar
    
    var body: some View {
        let weeks = splitDaysIntoWeeks(days: calendar.days)
        
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Text("Notifications")
                    .font(.largeTitle)
                    .frame(height: 98)
                    .frame(width: geometry.size.width)
                    .background(Color.brown.opacity(0.2))
                    .border(Color.brown, width: 1)
                
                VStack(spacing: 0) {
                    ForEach(0..<weeks.count, id: \.self) { weekIndex in
                        NotificationCell(thisWeeksDays: weeks[weekIndex])
                    }
                }
            }
        }
        .frame(width: 200)
    }
    
    
    // Split the days into 6 weeks
    func splitDaysIntoWeeks(days: [WorkoutDay]) -> [[WorkoutDay]] {
        
        var weeks: [[WorkoutDay]] = []
        
        for weekIndex in 0..<6 {
            let start = weekIndex * 7 + 1
            let end = min(start + 7, days.count)
            let week = Array(days[start..<end])
            weeks.append(week)
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
                ForEach(Array(generateNotifications()), id: \.self.key) { key, value in
                    Text("\(key): \(value)")
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
    func generateNotifications() -> [String: String] {
        var notifications: [String: String] = [:]
        
        let backToBackDays = WorkoutEvaluator.getAllBackToBack(in: thisWeeksDays)
        if !backToBackDays.isEmpty {
            let daysList = backToBackDays.sorted().map { "Day \($0)" }.joined(separator: ", ")
            notifications["BackToBack"] = daysList
        }
        
        if WorkoutEvaluator().dayOverload(in: thisWeeksDays) {
            notifications["Overloaded"] = "Less is more!"
        }
        
        //        if !WorkoutEvaluator().isEverythingGettingTrained(in: weekDays) {
        //            notifications["MissingMuscles"] = " (\group) missing"
        //        }
        
        return notifications
    }
}

