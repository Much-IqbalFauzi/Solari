//
//  SolariRoute.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//


import Foundation
import MapKit

struct SolariRoute {
    var id: UUID
    var name: String = ""
    var obstacles: [String] = []
    var startPoints: [SMarker]
    var markers: [SMarker]
    var description: String = ""
    var imageNames: [String] = []
    var looping: Int
    
    init(id: UUID, name: String, obstacles: [String], startPoints: [SMarker], markers: [SMarker], description: String, imageNames: [String], looping: Int) {
        self.id = id
        self.name = name
        self.obstacles = obstacles
        self.startPoints = startPoints
        self.markers = markers
        self.description = description
        self.imageNames = imageNames
        self.looping = looping
    }
}

extension SolariRoute: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: SolariRoute, rhs: SolariRoute) -> Bool {
        return lhs.id == rhs.id
    }
}
