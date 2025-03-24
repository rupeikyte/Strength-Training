//
//  ContentView.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import SwiftUI
import SwiftData

let backgroundApp = Color.blue
let colors: [Color] = [.gray, .red, .orange, .yellow,
                           .green, .blue, .purple, .pink]



struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    //    @State private var fgColor: Color = .gray
    let array: [Int] = Array(1...35)
    
    @State private var fgColor: Color = .gray
    
    let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    
    let workoutInfo: [String] = ["following workouts:", "1:"]
    
    
    
    
    var body: some View {
        
        ZStack {
            //            backgroundApp.opacity(0.8)
            VStack {
                Text("Schedule")
                    .font(.title)
                VStack {
                    Text("insert month var here")
                    
                    allDays
                    
                }
            }
        }
    }
    //assign exercises between days
    
    
    var allDays: some View {
        NavigationStack {
            ForEach(1..<6) { index1 in
                HStack(spacing: 10) {
                    ForEach(1..<8) { index2 in
                        NavigationLink(destination:  {
                            VStack{
                                //                                    ForEach(0..<self.workoutInfo.count, id: \.self) { index in
                                //                                        Text(self.workoutInfo[index])
                                Text(workoutInfo)
                                //                                    }
                            }
                            //                            .font(.title)
                            //                            .multilineTextAlignment(.center)
                            
                            
                            HStack{
                                Button("Arm") {
                                    workoutInfo.append("testing")
                                    //                                    Text("armInfo")
                                }
                                //                                Button("Shoulder") {
                                //                                    Text("shoulderInfo")
                                //                                }
                                //                                Button("Leg") {
                                //                                    Text("legsInfo")
                                //                                }
                                //                                Button("Back") {
                                //                                    Text("backInfo")
                                //                                }
                                //                                Button("Abs") {
                                //                                    Text("abInfo")
                                //                                }
                                //                                Button("Chest") {
                                //                                    Text("chestInfo")
                                //                                }
                            }
                            
                            
                        }, label: {
                            
                            MyRectangle(day: (index2)+(7*(index1-1)))
                        }
                        )
                    }
                }
            }
            .navigationTitle("testing1")
            
            
        }
        
    }
}
//}
    
    struct MyRectangle: View {
        
        @State private var fgColor: Color = .gray
        @State private var tall: CGFloat = 100
        
        let day: Int
        
        var workoutInfo = "workoutOfDay"
        
        var body: some View {
            
            VStack {
                Text("\(day)")
                Text(workoutInfo)
            }
          
            
            .padding()
            .background(fgColor)
            .frame(width: tall, height: 100)
            .cornerRadius(5)
//            .onTapGesture {
//                fgColor = colors.randomElement()!
//                
//            }
            
        }
    }
    


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
