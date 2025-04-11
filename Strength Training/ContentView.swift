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
    
    @State private var fgColor: Color = .gray
    
    @StateObject var calendar = WorkoutCalendar()
    
    let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var body: some View {
        NavigationStack{
            MonthView(calendar: calendar)
            
        }
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
