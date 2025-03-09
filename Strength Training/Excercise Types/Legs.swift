//
//  Legs.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/9/25.
//

class Legs: Excercise {
    
    override init(type: String, time: Double) {
        super.init(type: String, time: Double)
    }
    
    override func getTime() -> Double {
        return time
    }
    
    override func getType() -> String {
        return type
    }

}

