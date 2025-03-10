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
    @State private var fgColor: Color = .gray
    
    var body: some View {
        ZStack {
            backgroundApp.opacity(0.8)
            VStack {
                Text("Schedule")
                    .font(.title)
                VStack {
                    Text("insert month var here")
//                    Group {
                        ForEach(1..<6) { _ in
                            HStack(spacing: 10) {
                                ForEach(1..<8) { _ in
                                    RoundedRectangle(cornerRadius: 5).fill(fgColor).opacity(0.9).frame(width:100, height: 100).overlay(content: { Text("Workout(s)") })
                                        
                                        
                                    
                                }
                                
//                            }
                        }
                        .onTapGesture {
                            fgColor = colors.randomElement()!
                            
                        }
                    }
                }
                
            }
            
        }
    }
}


//func myFunction() {
//    backgroundApp.opacity(0.05)
//}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
