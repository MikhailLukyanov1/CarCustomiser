//
//  car.swift
//  CarCustomiser
//
//  Created by MIKHAEL LUKYANOV on 16/01/2023.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats()-> String {
        
        return """
Make: \(self.make)\nModel: \(self.model)\nTop speed: \(self.topSpeed)\nAcceleration (0-60 in): \(self.acceleration)\nHandling: \(self.handling)
"""

    }
}

