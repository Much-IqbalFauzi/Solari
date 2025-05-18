//
//  Waypoint.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 15/05/25.
//

import Foundation
import SwiftUI

struct SWaypoint {
    let id: UUID = UUID()
    let description: String
    let obstacles: [String]
    let activities: [String]
    
    init(description: String, obstacles: [String], activities: [String]) {
        self.description = description
        self.obstacles = obstacles
        self.activities = activities
    }
}

extension SWaypoint {
    static let A1 = SWaypoint(
        description: "Takes you all around GOP and earn the most stable pace movement",
        obstacles: [
            "Start from mid level ground",
            "wide space",
            "great contour"
                   ],
        activities: ["Push Up", "Skott Jump", "Sprint", "Squat"])
    static let A2 = SWaypoint(description: "A", obstacles: ["", ""], activities: ["Run", "Swim"])
    static let A3 = SWaypoint(description: "A", obstacles: ["", ""], activities: ["Run", "Swim"])
    static let A4 = SWaypoint(description: "A", obstacles: ["", ""], activities: ["Run", "Swim"])
    static let A5 = SWaypoint(description: "A", obstacles: ["", ""], activities: ["Run", "Swim"])
    static let A6 = SWaypoint(description: "A", obstacles: ["", ""], activities: ["Run", "Swim"])
}
