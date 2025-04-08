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
    var obstacles: [String] = []
    var startPoints: [sMarker]
    var markers: [sMarker]
    var description: String = ""
    var imageNames: [String] = []
    var looping: Int
    
    init(id: UUID, name: String, obstacles: [String], startPoints: [sMarker], markers: [sMarker], description: String, imageNames: [String], looping: Int) {
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
