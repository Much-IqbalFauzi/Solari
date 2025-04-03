//
//  SolariRoute.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 02/04/25.
//

import Foundation
import MapKit

struct solariRoute {
    var id: UUID
    var name: String = ""
    var distance: Double = 0
    var obstacles: [String] = []
    var startPoints: [sMarker]
    var markers: [sMarker]
    
    init(id: UUID, name: String, distance: Double, obstacles: [String], startPoints: [sMarker], markers: [sMarker]) {
        self.id = id
        self.name = name
        self.distance = distance
        self.obstacles = obstacles
        self.startPoints = startPoints
        self.markers = markers
    }
}
