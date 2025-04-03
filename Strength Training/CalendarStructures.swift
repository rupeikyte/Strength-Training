//
//  CalendarStructures.swift
//  Strength Training
//
//  Created by Noel Raehl on 3/27/25.
//

import SwiftUI


// A 5x6 grouping of days/rectangles on the homescreen. Also sets the days's daynumber appropriately. 
struct MonthView: View {
    @State private var fgColor: Color = .gray
    
    var body: some View {
        VStack {
            ForEach(0..<6) { week in
                HStack(spacing: 10) {
                    ForEach(0..<7) { day in
                        let dayNumber = week * 7 + day + 1
                        DayCell(dayNumber: dayNumber)
                    }
                }
            }
        }
    }
}


// The content of an individual rectangle on the homescreen. This includes the day number to be set, and eventually its programmed workouts. This is organized as a navigation link, with the label being the day rectangle, and its destination linked to the DayView struct.
struct DayCell: View {
    @State private var tall: CGFloat = 100
    
    let dayNumber: Int

    @State private var workoutInfo = Workouts()
//    @Environment(Workouts.self) private var workoutInfo
    
        
    var body: some View {
        
        NavigationLink(destination: {
            DayView(dayNumber: dayNumber)
        }, label: {
            Text("\(dayNumber)")
                .padding()
                .frame(width: tall, height: tall)
                .cornerRadius(5)
            
//            VStack {
//                ForEach(workoutInfo.dayWorkouts, id: \.self) { info in
//                    Text(info)
//                }
//            }
        })
    }
}

//struct TransferedText: View {
//    @Environment(Workouts.self) private var workoutInfo
//    
//    var body: some View {
//        
//    
//        VStack {
//            ForEach(workoutInfo.dayWorkouts, id: \.self) { info in
//                Text(info)
//                //                    Text(dayNumber.description)
//            }
//        }
////            .environment(workoutInfo)
//    }
//}





