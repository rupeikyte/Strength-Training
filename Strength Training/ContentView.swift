//
//  ContentView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @State var workoutInfo: [String] = []
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    let array: [Int] = Array(1...35)
    
    @State private var fgColor: Color = .gray
    
    let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    

    var body: some View {
    
        NavigationStack{
            MonthView()
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
