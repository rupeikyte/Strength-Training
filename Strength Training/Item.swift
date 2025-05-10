//
//  Item.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/7/25.
//

import Foundation
import SwiftData

@Model
/// Class helps saves the data for the user
final class ItemForSaving {
    var timestamp: Date
        var muscleGroups: [String: Bool]
        
        init(timestamp: Date = .now, muscleGroups: [String: Bool] = [:]) {
            self.timestamp = timestamp
            self.muscleGroups = muscleGroups
    }
}
