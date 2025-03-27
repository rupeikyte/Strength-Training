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
            }
        }
    }
}



//
//struct DayView: View {
//
//    @State private var fgColor: Color = .gray
//    @State private var tall: CGFloat = 100
//
//    let day: Int
//
//
////    @StateObject var workoutInfo = workouts()
//
//    var body: some View {
//
//        VStack {
//            Text("\(day)")
////            Text(workoutInfo.dayWorkouts[day])
//            Text("test")
//        }
//
//        .padding()
//        .background(fgColor)
//        .frame(width: tall, height: 100)
//        .cornerRadius(5)
//
//    }
//}
//
////struct workoutText: View {
//////    @StateObject var workoutInfo = workouts()
//////    cancellable = workoutInfo.objectWillChange
//////        .sink { _ in
//////
//////    }
////
////    var body: some View {
////        @StateObject var workoutInfo = workouts()
////
////        VStack{
////            ForEach(0..<self.workoutInfo.dayWorkouts.count, id: \.self) { index in
////                Text(self.workoutInfo.dayWorkouts[index])
////            }
////            .font(.title)
////        }
////    }
////}
//
////class workouts : ObservableObject {
////    @Published var dayWorkouts: [String] = []
////}
//
//
//
////struct workout {
////
////}
////
////struct schedule {
////
////}
//

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
