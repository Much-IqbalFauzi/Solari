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

    solariRoute(
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
    
    solariRoute(
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
    )
      

//    solariRoute(
//        id: UUID(), name: "Power Run", obstacles: [],
//        startPoints: [
//            sMarker(name: "A", coordinate: .p57, showMarker: true),
//            sMarker(name: "B", coordinate: .p68, showMarker: true),
//            sMarker(name: "C", coordinate: .p38, showMarker: true),
//        ],
//        markers: [
//            sMarker(name: "A", coordinate: .p57, showMarker: true),
//            sMarker(name: "", coordinate: .p49, showMarker: false),
//            sMarker(name: "p1", coordinate: .p50, showMarker: false),
//            sMarker(name: "p2", coordinate: .p51, showMarker: false),
//            sMarker(name: "p3", coordinate: .p52, showMarker: false),
//            sMarker(name: "p4", coordinate: .p53, showMarker: false),
//            sMarker(name: "p5", coordinate: .p69, showMarker: false),
//            sMarker(name: "p6", coordinate: .p70, showMarker: false),
//            sMarker(name: "p7", coordinate: .p71, showMarker: false),
//            sMarker(name: "p8", coordinate: .p67, showMarker: false),
//            sMarker(name: "B", coordinate: .p68, showMarker: true),
//            sMarker(name: "p10", coordinate: .p27, showMarker: false),
//            sMarker(name: "p11", coordinate: .p26, showMarker: false),
//            sMarker(name: "p12", coordinate: .p25, showMarker: false),
//            sMarker(name: "C", coordinate: .p38, showMarker: true),
//            sMarker(name: "p14", coordinate: .p63, showMarker: false),
//            sMarker(name: "p15", coordinate: .p62, showMarker: false),
//            sMarker(name: "p16", coordinate: .p61, showMarker: false),
//            sMarker(name: "p17", coordinate: .p60, showMarker: false),
//            sMarker(name: "p16", coordinate: .p39, showMarker: false),
//            sMarker(name: "p17", coordinate: .p40, showMarker: false),
//            sMarker(name: "p18", coordinate: .p54, showMarker: false),
//            sMarker(name: "p5", coordinate: .p55, showMarker: false),
//            sMarker(name: "p6", coordinate: .p56, showMarker: false),
//            sMarker(name: "A", coordinate: .p57, showMarker: true),
//        ], description: "", imageNames: ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"],
//        looping: 3
    ]
//enum markerName: String {
//    case GOP9 = "GOP 9"
//    case SINARMAS = "Sinarmas"
//    case MARKETING = "Marketing"
//    case BREEZE = "The Breeze"
//    case MARKET = "Supermarket"
//}
