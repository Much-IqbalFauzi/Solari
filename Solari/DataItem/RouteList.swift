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
        name: "Short Run",
        obstacles: [
            "±1 km Run (5x laps)",
            "5x Upstairs",
            "5x Downstairs",
            "±45 m Elevation gain in total",
            "Concrete blocks path, Pedestrian",
            "Adjacent to the roads at the bottom",
        ],
        startPoints: [
            sMarker(name: markerName.BREEZE.rawValue, coordinate: .point1),
            sMarker(name: markerName.MARKET.rawValue, coordinate: .point2),
        ],
        markers: [
            sMarker(name: markerName.MARKET.rawValue, coordinate: .point1),
            sMarker(name: markerName.BREEZE.rawValue, coordinate: .point2),
            sMarker(name: "Market Stair", coordinate: .point3),
            sMarker(name: "Breeze Stair", coordinate: .point4),
        ],
        description:
            "A strength, vertical and mix of trail and grit. Hey strength runners, this one’s for you!",
        imageNames: [
            "SHORT1", "SHORT2", "SHORT3", "SHORT4", "SHORT5", "SHORT6",
        ]
    ),

    solariRoute(
        id: UUID(),
        name: "Long Run",
        obstacles: [
            "±5 km (6x laps)",
            "± 60 m Elevation gain in total",
            "3 Points",
            "Concrete blocks path, Pedestrian",
            "Adjacent to the roads",
        ],
        startPoints: [
            sMarker(name: markerName.GOP9.rawValue, coordinate: .point6),
            sMarker(name: markerName.SINARMAS.rawValue, coordinate: .point7),
            sMarker(name: markerName.MARKETING.rawValue, coordinate: .point8),
        ],
        markers: [
            sMarker(name: markerName.GOP9.rawValue, coordinate: .point6),
            sMarker(name: markerName.SINARMAS.rawValue, coordinate: .point7),
            sMarker(name: markerName.MARKETING.rawValue, coordinate: .point8),
        ],
        description: "Suits for maintain your pace with your own limits!",
        imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"]
    ),
    solariRoute(
        id: UUID(), name: "GABUT (TEST)", obstacles: [], startPoints: [
            sMarker(name: "p1", coordinate: .p1, showMarker: true),
            sMarker(name: "p10", coordinate: .p10, showMarker: true),
        ],
        markers: [
            sMarker(name: "p1", coordinate: .p1, showMarker: true),
            sMarker(name: "p2", coordinate: .p2, showMarker: false),
            sMarker(name: "p3", coordinate: .p3, showMarker: false),
            sMarker(name: "p4", coordinate: .p4, showMarker: false),
            sMarker(name: "p5", coordinate: .p5, showMarker: true),
            sMarker(name: "p6", coordinate: .p6, showMarker: false),
            sMarker(name: "p7", coordinate: .p7, showMarker: false),
            sMarker(name: "p8", coordinate: .p8, showMarker: true),
            sMarker(name: "p9", coordinate: .p9, showMarker: false),
            sMarker(name: "p10", coordinate: .p10, showMarker: true),
        ], description: "", imageNames: []),
]

enum markerName: String {
    case GOP9 = "GOP 9"
    case SINARMAS = "Sinarmas"
    case MARKETING = "Marketing"
    case BREEZE = "The Breeze"
    case MARKET = "Supermarket"
}
