//
//  RunData.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 04/04/25.
//

import SwiftData
import Foundation

@Model
class RunSession {
    var id: UUID = UUID()
    var date: Date
    var duration: TimeInterval
    var distance: Double
    var pace: Double
    
    init(date: Date, duration: TimeInterval, distance: Double, pace: Double) {
        self.date = date
        self.duration = duration
        self.distance = distance
        self.pace = pace
    }
}
