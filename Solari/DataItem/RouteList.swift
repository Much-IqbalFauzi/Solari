//
//  RouteList.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 03/04/25.
//

import Foundation
import MapKit

var routes: [solariRoute] = [
    //    solariRoute(
    //        id: UUID(),
    //        name: "Short Run",
    //        obstacles: [
    //            "±1 km Run (5x laps)",
    //            "5x Upstairs",
    //            "5x Downstairs",
    //            "±45 m Elevation gain in total",
    //            "Concrete blocks path, Pedestrian",
    //            "Adjacent to the roads at the bottom",
    //        ],
    //        startPoints: [
    //            sMarker(name: markerName.BREEZE.rawValue, coordinate: .point1),
    //            sMarker(name: markerName.MARKET.rawValue, coordinate: .point2),
    //        ],
    //        markers: [
    //            sMarker(name: markerName.MARKET.rawValue, coordinate: .point1),
    //            sMarker(name: markerName.BREEZE.rawValue, coordinate: .point2),
    //            sMarker(name: "Market Stair", coordinate: .point3),
    //            sMarker(name: "Breeze Stair", coordinate: .point4),
    //        ],
    //        description:
    //            "A strength, vertical and mix of trail and grit. Hey strength runners, this one’s for you!",
    //        imageNames: [
    //            "SHORT1", "SHORT2", "SHORT3", "SHORT4", "SHORT5", "SHORT6",
    //        ],
    //        looping: 0
    //
    //    ),
    //
    //    solariRoute(
    //        id: UUID(),
    //        name: "Long Run",
    //        obstacles: [
    //            "±5 km (6x laps)",
    //            "± 60 m Elevation gain in total",
    //            "3 Points",
    //            "Concrete blocks path, Pedestrian",
    //            "Adjacent to the roads",
    //        ],
    //        startPoints: [
    //            sMarker(name: markerName.GOP9.rawValue, coordinate: .point6),
    //            sMarker(name: markerName.SINARMAS.rawValue, coordinate: .point7),
    //            sMarker(name: markerName.MARKETING.rawValue, coordinate: .point8),
    //        ],
    //        markers: [
    //            sMarker(name: markerName.GOP9.rawValue, coordinate: .point6),
    //            sMarker(name: markerName.SINARMAS.rawValue, coordinate: .point7),
    //            sMarker(name: markerName.MARKETING.rawValue, coordinate: .point8),
    //        ],
    //        description: "Suits for maintain your pace with your own limits!",
    //        imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
    //        looping: 0
    //
    //    ),
    solariRoute(
        id: UUID(), name: "Long Run", obstacles: [],
        startPoints: [
            sMarker(name: "p1", coordinate: .p1, showMarker: true),
            sMarker(name: "A", coordinate: .p10, showMarker: true),
        ],
        markers: [
            sMarker(name: "p1", coordinate: .p1, showMarker: false),
            sMarker(name: "p9", coordinate: .p33, showMarker: false),
            sMarker(name: "p9", coordinate: .p34, showMarker: false),
            sMarker(name: "p9", coordinate: .p35, showMarker: false),
            sMarker(name: "p9", coordinate: .p36, showMarker: false),
            sMarker(name: "p9", coordinate: .p37, showMarker: false),
            sMarker(name: "C", coordinate: .p21, showMarker: true),
            sMarker(name: "p7", coordinate: .p23, showMarker: false),
            sMarker(name: "p8", coordinate: .p24, showMarker: false),
            sMarker(name: "p9", coordinate: .p25, showMarker: false),
            sMarker(name: "B", coordinate: .p26, showMarker: true),
            sMarker(name: "p12", coordinate: .p27, showMarker: false),
            sMarker(name: "p13", coordinate: .p28, showMarker: false),
            sMarker(name: "p14", coordinate: .p29, showMarker: false),
            sMarker(name: "A", coordinate: .p30, showMarker: true),
            sMarker(name: "p16", coordinate: .p31, showMarker: false),
            sMarker(name: "p1", coordinate: .p1, showMarker: false),
        ], description: "Suits for maintain your pace with your own limits!\n - ±5 km (6x laps)\n - ± 60 m Elevation gain in total\n - 3 Points\n - No stairs\n - Concrete blocks path, Pedestrian\n - Adjacent to the roads", imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
        looping: 6),

    solariRoute(
        id: UUID(), name: "Strength Run", obstacles: [],
        startPoints: [
            sMarker(name: "Stair A", coordinate: .p49, showMarker: true),
            sMarker(name: "Stair D", coordinate: .p57, showMarker: true),
        ],
        
        markers: [
            sMarker(name: "Stair A", coordinate: .p41, showMarker: false),
            sMarker(name: "p1", coordinate: .p50, showMarker: false),
            sMarker(name: "p2", coordinate: .p51, showMarker: false),
            sMarker(name: "p3", coordinate: .p52, showMarker: false),
            sMarker(name: "", coordinate: .p53, showMarker: true),
            sMarker(name: "", coordinate: .p54, showMarker: true),
            sMarker(name: "p5", coordinate: .p55, showMarker: false),
            sMarker(name: "p6", coordinate: .p56, showMarker: false),
            sMarker(name: "D", coordinate: .p57, showMarker: true),
        ], description: "", imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
        looping: 5
    ),

    solariRoute(
        id: UUID(), name: "Power Run", obstacles: [],
        startPoints: [
            sMarker(name: "A", coordinate: .p57, showMarker: true),
            sMarker(name: "B", coordinate: .p68, showMarker: true),
            sMarker(name: "C", coordinate: .p38, showMarker: true),
        ],
        markers: [
            sMarker(name: "A", coordinate: .p57, showMarker: true),
            sMarker(name: "", coordinate: .p49, showMarker: false),
            sMarker(name: "p1", coordinate: .p50, showMarker: false),
            sMarker(name: "p2", coordinate: .p51, showMarker: false),
            sMarker(name: "p3", coordinate: .p52, showMarker: false),
            sMarker(name: "p4", coordinate: .p53, showMarker: false),
            sMarker(name: "p5", coordinate: .p69, showMarker: false),
            sMarker(name: "p6", coordinate: .p70, showMarker: false),
            sMarker(name: "p7", coordinate: .p71, showMarker: false),
            sMarker(name: "p8", coordinate: .p67, showMarker: false),
            sMarker(name: "B", coordinate: .p68, showMarker: true),
            sMarker(name: "p10", coordinate: .p27, showMarker: false),
            sMarker(name: "p11", coordinate: .p26, showMarker: false),
            sMarker(name: "p12", coordinate: .p25, showMarker: false),
            sMarker(name: "C", coordinate: .p38, showMarker: true),
            sMarker(name: "p14", coordinate: .p63, showMarker: false),
            sMarker(name: "p15", coordinate: .p62, showMarker: false),
            sMarker(name: "p16", coordinate: .p61, showMarker: false),
            sMarker(name: "p17", coordinate: .p60, showMarker: false),
            sMarker(name: "p16", coordinate: .p39, showMarker: false),
            sMarker(name: "p17", coordinate: .p40, showMarker: false),
            sMarker(name: "p18", coordinate: .p54, showMarker: false),
            sMarker(name: "p5", coordinate: .p55, showMarker: false),
            sMarker(name: "p6", coordinate: .p56, showMarker: false),
            sMarker(name: "A", coordinate: .p57, showMarker: true),
        ], description: "", imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
        looping: 3
    ),

    solariRoute(
        id: UUID(), name: "Iya", obstacles: [],
        startPoints: [
            .p1,
            .p4,
            .p7,
        ],
        markers: [
            .p1,
            .p2,
            .p3,
            .p4,
            .p5,
            .p6,
            .p7,
        ], description: "", imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
        looping: 5
    ),
]

enum markerName: String {
    case GOP9 = "GOP 9"
    case SINARMAS = "Sinarmas"
    case MARKETING = "Marketing"
    case BREEZE = "The Breeze"
    case MARKET = "Supermarket"
}
