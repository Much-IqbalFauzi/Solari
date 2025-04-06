//
//  RouteList.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 03/04/25.
//

import Foundation
import MapKit

var routes: [solariRoute] = [
    solariRoute(
        id: UUID(),
        name: "Pendek",
        distance: 2.4,
        obstacles: [],
        startPoints: [
            sMarker(name: markerName.EUTOPIA.rawValue, coordinate: .point1),
            sMarker(name: markerName.CASANDREA.rawValue, coordinate: .point3)
        ],
        markers: [
            sMarker(name: markerName.EUTOPIA.rawValue, coordinate: .point1),
            sMarker(name: markerName.DESTOPIA.rawValue, coordinate: .point2),
            sMarker(name: markerName.CASANDREA.rawValue, coordinate: .point3)
        ]),
    
    solariRoute(
        id: UUID(),
        name: "Sedeng",
        distance: 4.4,
        obstacles: [],
        startPoints: [
            sMarker(name: markerName.EUTOPIA.rawValue, coordinate: .point1),
            sMarker(name: markerName.EUTOPIA.rawValue, coordinate: .point3)
        ],
        markers: [
            sMarker(name: markerName.EUTOPIA.rawValue, coordinate: .point2),
            sMarker(name: markerName.CASANDREA.rawValue, coordinate: .point4),
            sMarker(name: markerName.DESTOPIA.rawValue, coordinate: .point3)
        ]),
]

enum markerName: String {
    case EUTOPIA = "Eutopia"
    case DESTOPIA = "Destopia"
    case CASANDREA = "Casandra"
}

