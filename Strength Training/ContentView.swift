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
    
    var body: some View {
        NavigationStack{
            MonthView(calendar: calendar)
        }
    }
}

class Workouts: ObservableObject {
     @Published var dayWorkouts: [String] = []
 }


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
