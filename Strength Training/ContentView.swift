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

    var body: some View {
        ZStack{
//            GeometryReader { geometry in
            Color.white
                NavigationStack{
                    MonthView(calendar: calendar, month: month, year: year)
                        .padding(.leading, 5)
                  
                        .padding(.trailing, 5)
                        
                        .padding(.bottom, 5)

                        
                }
                
//            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
