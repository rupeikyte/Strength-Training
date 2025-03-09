//
//  Excercise.swift
//  Strength Training
//
//  Created by Rūta Rupeikytė on 3/9/25.
//

class Excercise {
    var type: String
    var time: Double
    
    init(type: String, time: Double) {
        self.type = type
        self.time = time
    }
    
    var description: String {
        return "The workout is named at \(type)."
    }
    func getType() -> String{
        return type
    }
    
    func getTime() -> Double{
        return time
    }

}

