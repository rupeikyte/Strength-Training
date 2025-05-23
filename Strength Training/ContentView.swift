//
//  ContentView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI
import SwiftData

/// Renders the main UI of the Strength Training program. This is the homescreen with the main calendar.
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    var calendar = WorkoutCalendar()
    @State var month = Calendar.current.component(.month, from: Date())
    @State var year = Calendar.current.component(.year, from: Date())
    let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)
    
    var body: some View {
        ZStack{
            bgBrown
            NavigationStack {
                HStack {
                    MonthView(calendar: calendar, month: month, year: year)
                        .border(Color.brown, width: 2)
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                        .padding(.bottom, 25)
                        .padding(.top, 25)
                        .border(Color.brown, width:2)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
