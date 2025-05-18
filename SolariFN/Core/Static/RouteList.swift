//
//  RouteList.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//


import Foundation
import MapKit

var routes: [SolariRoute] = [
    SolariRoute(
        id: UUID(), name: "Long Run",
        obstacles: [ "±5 km (6x laps)",
                     "± 60 m Elevation gain in total",
                     "3 Points",
                     "Concrete blocks path, Pedestrian",
                     "Adjacent to the roads",],
        startPoints: [
            .r13,
            .r9,
            .r5,
        ],
        markers: [
            .r1,
            .r2,
            .r3,
            .r4,
            .rtlr1,
            .rtlr2,
            .r5,
            .r6,
            .r7,
            .r8,
            .r9,
            .r10,
            .r11,
            .r12,
            .r13,
            .r14,
            .r1
        ], description: "Suits for maintain your pace with your own limits!",
        imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
        looping: 6
    ),

    SolariRoute(
        id: UUID(), name: "Strength Run",
        obstacles: [ "±1 km Run (5x laps)",
                     "5x Upstairs",
                     "5x Downstairs",
                     "±45 m Elevation gain in total",
                     "Concrete blocks path, Pedestrian",
                     "Adjacent to the roads at the bottom",],
        startPoints: [
            .r15,
            .r22,
        ],
        markers: [
            .r15,
            .r16,
            .rtlp1,
            .r17,
            .r18,
            .r19,
            .r20,
            .r21,
            .r22,
            .r15
        ], description: "A strength, vertical and mix of trail and grit. Hey strength runners, this one’s for you!",
        imageNames: ["SHORT1", "SHORT2", "SHORT3", "SHORT4", "SHORT5", "SHORT6"],
        looping: 5
    ),
    
    SolariRoute(
        id: UUID(), name: "Power Run",
        obstacles: [ "±3 km Run (4x laps)",
                     "5x Upstairs",
                     "5x Downstairs",
                     "±100 rung-stairs",
                     "±80 m Elevation gain in total",
                     "Concrete blocks path, Pedestrian",
                     "Adjacent to the roads at the bottom and roads",],
        startPoints: [
            .r23,
            .r33,
            .r36,
        ],
        markers: [
            .r23,
            .r24,
            .r25,
            .r25,
            .r26,
            .r27,
            .r28,
            .r29,
            .r30,
            .r31,
            .r32,
            .r33,
            .r34,
            .r35,
            .rtpr1,
            .r36,
            .r37,
            .r38,
            .r39,
            .r40,
            .r41,
            .r42,
            .r43,
            .r45,
        ], description: "Special for in mood to built bold, forged on incline and instinct.",
        imageNames: ["POWER1", "POWER2", "POWER3", "POWER4", "POWER5", "POWER6","POWER7"],
        looping: 3
    ),
//    SolariRoute(
//        id: UUID(), name: "Long Run", obstacles: [],
//        startPoints: [
//            SMarker(name: "p1", coordinate: .p1, showMarker: true),
//            SMarker(name: "A", coordinate: .p10, showMarker: true),
//        ],
//        markers: [
//            SMarker(name: "p1", coordinate: .p1, showMarker: false),
//            SMarker(name: "p9", coordinate: .p33, showMarker: false),
//            SMarker(name: "p9", coordinate: .p34, showMarker: false),
//            SMarker(name: "p9", coordinate: .p35, showMarker: false),
//            SMarker(name: "p9", coordinate: .p36, showMarker: false),
//            SMarker(name: "p9", coordinate: .p37, showMarker: false),
//            SMarker(name: "C", coordinate: .p21, showMarker: true),
//            SMarker(name: "p7", coordinate: .p23, showMarker: false),
//            SMarker(name: "p8", coordinate: .p24, showMarker: false),
//            SMarker(name: "p9", coordinate: .p25, showMarker: false),
//            SMarker(name: "B", coordinate: .p26, showMarker: true),
//            SMarker(name: "p12", coordinate: .p27, showMarker: false),
//            SMarker(name: "p13", coordinate: .p28, showMarker: false),
//            SMarker(name: "p14", coordinate: .p29, showMarker: false),
//            SMarker(name: "A", coordinate: .p30, showMarker: true),
//            SMarker(name: "p16", coordinate: .p31, showMarker: false),
//            SMarker(name: "p1", coordinate: .p1, showMarker: false),
//        ], description: "Suits for maintain your pace with your own limits!\n - ±5 km (6x laps)\n - ± 60 m Elevation gain in total\n - 3 Points\n - No stairs\n - Concrete blocks path, Pedestrian\n - Adjacent to the roads", imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
//        looping: 6),

//    SolariRoute(
//        id: UUID(), name: "Strength Run", obstacles: [],
//        startPoints: [
//            SMarker(name: "Stair A", coordinate: .p49, showMarker: true),
//            SMarker(name: "Stair D", coordinate: .p57, showMarker: true),
//        ],
//        
//        markers: [
//            SMarker(name: "Stair A", coordinate: .p41, showMarker: false),
//            SMarker(name: "p1", coordinate: .p50, showMarker: false),
//            SMarker(name: "p2", coordinate: .p51, showMarker: false),
//            SMarker(name: "p3", coordinate: .p52, showMarker: false),
//            SMarker(name: "", coordinate: .p53, showMarker: true),
//            SMarker(name: "", coordinate: .p54, showMarker: true),
//            SMarker(name: "p5", coordinate: .p55, showMarker: false),
//            SMarker(name: "p6", coordinate: .p56, showMarker: false),
//            SMarker(name: "D", coordinate: .p57, showMarker: true),
//        ], description: "", imageNames: [],
//        looping: 5
//    ),

//    SolariRoute(
//        id: UUID(), name: "Power Run", obstacles: [],
//        startPoints: [
//            SMarker(name: "A", coordinate: .p57, showMarker: true),
//            SMarker(name: "B", coordinate: .p68, showMarker: true),
//            SMarker(name: "C", coordinate: .p38, showMarker: true),
//        ],
//        markers: [
//            SMarker(name: "A", coordinate: .p57, showMarker: true),
//            SMarker(name: "", coordinate: .p49, showMarker: false),
//            SMarker(name: "p1", coordinate: .p50, showMarker: false),
//            SMarker(name: "p2", coordinate: .p51, showMarker: false),
//            SMarker(name: "p3", coordinate: .p52, showMarker: false),
//            SMarker(name: "p4", coordinate: .p53, showMarker: false),
//            SMarker(name: "p5", coordinate: .p69, showMarker: false),
//            SMarker(name: "p6", coordinate: .p70, showMarker: false),
//            SMarker(name: "p7", coordinate: .p71, showMarker: false),
//            SMarker(name: "p8", coordinate: .p67, showMarker: false),
//            SMarker(name: "B", coordinate: .p68, showMarker: true),
//            SMarker(name: "p10", coordinate: .p27, showMarker: false),
//            SMarker(name: "p11", coordinate: .p26, showMarker: false),
//            SMarker(name: "p12", coordinate: .p25, showMarker: false),
//            SMarker(name: "C", coordinate: .p38, showMarker: true),
//            SMarker(name: "p14", coordinate: .p63, showMarker: false),
//            SMarker(name: "p15", coordinate: .p62, showMarker: false),
//            SMarker(name: "p16", coordinate: .p61, showMarker: false),
//            SMarker(name: "p17", coordinate: .p60, showMarker: false),
//            SMarker(name: "p16", coordinate: .p39, showMarker: false),
//            SMarker(name: "p17", coordinate: .p40, showMarker: false),
//            SMarker(name: "p18", coordinate: .p54, showMarker: false),
//            SMarker(name: "p5", coordinate: .p55, showMarker: false),
//            SMarker(name: "p6", coordinate: .p56, showMarker: false),
//            SMarker(name: "A", coordinate: .p57, showMarker: true),
//        ], description: "", imageNames: [],
//        looping: 3
//    )

    SolariRoute(
        id: UUID(), name: "Iya", obstacles: ["", ""],
        startPoints: [
        ],
        markers: [
            .d1,
            .d2
        ], description: "Foresta da Iya", imageNames: [],
        looping: 5
    ),
]
