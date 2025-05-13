//
//  RouteList.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//


import Foundation
import MapKit

var routes: [SolariRoute] = [
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
    //            SMarker(name: markerName.BREEZE.rawValue, coordinate: .point1),
    //            SMarker(name: markerName.MARKET.rawValue, coordinate: .point2),
    //        ],
    //        markers: [
    //            SMarker(name: markerName.MARKET.rawValue, coordinate: .point1),
    //            SMarker(name: markerName.BREEZE.rawValue, coordinate: .point2),
    //            SMarker(name: "Market Stair", coordinate: .point3),
    //            SMarker(name: "Breeze Stair", coordinate: .point4),
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
    //            SMarker(name: markerName.GOP9.rawValue, coordinate: .point6),
    //            SMarker(name: markerName.SINARMAS.rawValue, coordinate: .point7),
    //            SMarker(name: markerName.MARKETING.rawValue, coordinate: .point8),
    //        ],
    //        markers: [
    //            SMarker(name: markerName.GOP9.rawValue, coordinate: .point6),
    //            SMarker(name: markerName.SINARMAS.rawValue, coordinate: .point7),
    //            SMarker(name: markerName.MARKETING.rawValue, coordinate: .point8),
    //        ],
    //        description: "Suits for maintain your pace with your own limits!",
    //        imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
    //        looping: 0
    //
    //    ),
    SolariRoute(
        id: UUID(), name: "Long Run", obstacles: [],
        startPoints: [
            SMarker(name: "p1", coordinate: .p1, showMarker: true),
            SMarker(name: "A", coordinate: .p10, showMarker: true),
        ],
        markers: [
            SMarker(name: "p1", coordinate: .p1, showMarker: false),
            SMarker(name: "p9", coordinate: .p33, showMarker: false),
            SMarker(name: "p9", coordinate: .p34, showMarker: false),
            SMarker(name: "p9", coordinate: .p35, showMarker: false),
            SMarker(name: "p9", coordinate: .p36, showMarker: false),
            SMarker(name: "p9", coordinate: .p37, showMarker: false),
            SMarker(name: "C", coordinate: .p21, showMarker: true),
            SMarker(name: "p7", coordinate: .p23, showMarker: false),
            SMarker(name: "p8", coordinate: .p24, showMarker: false),
            SMarker(name: "p9", coordinate: .p25, showMarker: false),
            SMarker(name: "B", coordinate: .p26, showMarker: true),
            SMarker(name: "p12", coordinate: .p27, showMarker: false),
            SMarker(name: "p13", coordinate: .p28, showMarker: false),
            SMarker(name: "p14", coordinate: .p29, showMarker: false),
            SMarker(name: "A", coordinate: .p30, showMarker: true),
            SMarker(name: "p16", coordinate: .p31, showMarker: false),
            SMarker(name: "p1", coordinate: .p1, showMarker: false),
        ], description: "Suits for maintain your pace with your own limits!\n - ±5 km (6x laps)\n - ± 60 m Elevation gain in total\n - 3 Points\n - No stairs\n - Concrete blocks path, Pedestrian\n - Adjacent to the roads", imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
        looping: 6),

    SolariRoute(
        id: UUID(), name: "Strength Run", obstacles: [],
        startPoints: [
            SMarker(name: "Stair A", coordinate: .p49, showMarker: true),
            SMarker(name: "Stair D", coordinate: .p57, showMarker: true),
        ],
        
        markers: [
            SMarker(name: "Stair A", coordinate: .p41, showMarker: false),
            SMarker(name: "p1", coordinate: .p50, showMarker: false),
            SMarker(name: "p2", coordinate: .p51, showMarker: false),
            SMarker(name: "p3", coordinate: .p52, showMarker: false),
            SMarker(name: "", coordinate: .p53, showMarker: true),
            SMarker(name: "", coordinate: .p54, showMarker: true),
            SMarker(name: "p5", coordinate: .p55, showMarker: false),
            SMarker(name: "p6", coordinate: .p56, showMarker: false),
            SMarker(name: "D", coordinate: .p57, showMarker: true),
        ], description: "", imageNames: [],
        looping: 5
    ),

    SolariRoute(
        id: UUID(), name: "Power Run", obstacles: [],
        startPoints: [
            SMarker(name: "A", coordinate: .p57, showMarker: true),
            SMarker(name: "B", coordinate: .p68, showMarker: true),
            SMarker(name: "C", coordinate: .p38, showMarker: true),
        ],
        markers: [
            SMarker(name: "A", coordinate: .p57, showMarker: true),
            SMarker(name: "", coordinate: .p49, showMarker: false),
            SMarker(name: "p1", coordinate: .p50, showMarker: false),
            SMarker(name: "p2", coordinate: .p51, showMarker: false),
            SMarker(name: "p3", coordinate: .p52, showMarker: false),
            SMarker(name: "p4", coordinate: .p53, showMarker: false),
            SMarker(name: "p5", coordinate: .p69, showMarker: false),
            SMarker(name: "p6", coordinate: .p70, showMarker: false),
            SMarker(name: "p7", coordinate: .p71, showMarker: false),
            SMarker(name: "p8", coordinate: .p67, showMarker: false),
            SMarker(name: "B", coordinate: .p68, showMarker: true),
            SMarker(name: "p10", coordinate: .p27, showMarker: false),
            SMarker(name: "p11", coordinate: .p26, showMarker: false),
            SMarker(name: "p12", coordinate: .p25, showMarker: false),
            SMarker(name: "C", coordinate: .p38, showMarker: true),
            SMarker(name: "p14", coordinate: .p63, showMarker: false),
            SMarker(name: "p15", coordinate: .p62, showMarker: false),
            SMarker(name: "p16", coordinate: .p61, showMarker: false),
            SMarker(name: "p17", coordinate: .p60, showMarker: false),
            SMarker(name: "p16", coordinate: .p39, showMarker: false),
            SMarker(name: "p17", coordinate: .p40, showMarker: false),
            SMarker(name: "p18", coordinate: .p54, showMarker: false),
            SMarker(name: "p5", coordinate: .p55, showMarker: false),
            SMarker(name: "p6", coordinate: .p56, showMarker: false),
            SMarker(name: "A", coordinate: .p57, showMarker: true),
        ], description: "", imageNames: [],
        looping: 3
    ),

    SolariRoute(
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
        ], description: "", imageNames: [],
        looping: 5
    ),
]
