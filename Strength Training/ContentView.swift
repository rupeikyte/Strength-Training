//
//  ContentView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @StateObject var calendar = WorkoutCalendar()
    
    //TODO, this should not be 0?
    @State var month = 0
    @State var year = 0
    let bgBrown = Color(hue: 30/360, saturation: 0.3, brightness: 0.8)
    
    var body: some View {
        ZStack{
            bgBrown
            NavigationStack{

                HStack{
                    MonthView(calendar: calendar, month: month, year: year)
                        .border(Color.brown, width: 2)
                    
                        .padding(.leading, 25)

                        .padding(.trailing, 25)
                    
                        .padding(.bottom, 25)
                    
                        .padding(.top, 25)
                    
                        .border(Color.brown, width:2)
                    
                    NotificationView(calendar:calendar)
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
