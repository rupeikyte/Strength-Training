//
//  Item.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
        var muscleGroups: [String: Bool]
        
        init(timestamp: Date = .now, muscleGroups: [String: Bool] = [:]) {
            self.timestamp = timestamp
            self.muscleGroups = muscleGroups
    }
}
