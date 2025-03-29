//
//  CalendarStructures.swift
//  Strength Training
//
//  Created by Noel Raehl on 3/27/25.
//

import SwiftUI


struct MonthView: View {
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


struct DayCell: View {
    @State private var fgColor: Color = .gray
    @State private var tall: CGFloat = 100
    
    let dayNumber: Int
    
    var body: some View {
        NavigationLink(destination: DayView(dayNumber: dayNumber)) {
            Text("\(dayNumber)")
                .padding()
                .background(fgColor)
                .frame(width: tall, height: tall)
                .cornerRadius(5)
        }
    }
}





