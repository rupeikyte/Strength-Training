//
//  ContentView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI
import SwiftData

//let colors: [Color] = [.gray, .red, .orange, .yellow,
//                           .green, .blue, .purple, .pink]

//var getDayInformation = Day



struct ContentView: View {
    
    @State var workoutInfo: [String] = []
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    let array: [Int] = Array(1...35)
    
    @State private var fgColor: Color = .gray
    
    let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Schedule")
                    .font(.title)
                MonthView()
                VStack {
                    Text("insert month var here")
                    allDays
                }
            }
        }
    }
    //assign exercises between days
    
    
    var workoutText: some View {
        VStack{
            ForEach(0..<self.workoutInfo.count, id: \.self) { index in
                Text(self.workoutInfo[index])
            }
            .font(.title)
        }
    }
    
    
    var allDays: some View {
        NavigationStack {
            ForEach(1..<6) { index1 in
                HStack(spacing: 10) {
                    ForEach(1..<8) { index2 in
                    }
                }
            }
            NavigationLink(destination:  {
                ScrollView {
                    VStack{
                        Text("Schedule")
                            .font(.title)
                    }
                }}, label: {
                    
                    MonthView()
                })
            
        }
    }



class Workouts : ObservableObject {
    @Published var dayWorkouts: [String]
    
    init(dayWorkouts: [String]) {
        self.dayWorkouts = dayWorkouts
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
