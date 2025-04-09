//
//  SMarker.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 03/04/25.
//

import MapKit
import Foundation

struct sMarker {
    var id: UUID
    var name: String
    var showMarker: Bool = true
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D, showMarker: Bool = true) {
        self.id = UUID()
        self.name = name
        self.coordinate = coordinate
        self.showMarker = showMarker
    }
}

extension sMarker {
    static let r1 = sMarker(name: "r1", coordinate: CLLocationCoordinate2D(latitude: -6.30278, longitude: 106.65233), showMarker: false)
    static let r2 = sMarker(name: "r2", coordinate: CLLocationCoordinate2D(latitude: -6.30266, longitude: 106.65254), showMarker: false)
    static let r3 = sMarker(name: "r3", coordinate: CLLocationCoordinate2D(latitude: -6.30229, longitude: 106.65283), showMarker: false)
    static let r4 = sMarker(name: "r4", coordinate: CLLocationCoordinate2D(latitude: -6.30212, longitude: 106.65290), showMarker: false)
    static let rtlr1 = sMarker(name: "rtlr1", coordinate: CLLocationCoordinate2D(latitude: -6.30138, longitude: 106.65303), showMarker: false)
    static let rtlr2 = sMarker(name: "rtlr2", coordinate: CLLocationCoordinate2D(latitude: -6.30087, longitude: 106.65300), showMarker: false)
    static let r5 = sMarker(name: "C", coordinate: CLLocationCoordinate2D(latitude: -6.30069, longitude: 106.65286))
    static let r6 = sMarker(name: "r6", coordinate: CLLocationCoordinate2D(latitude: -6.30034, longitude: 106.65243), showMarker: false)
    static let r7 = sMarker(name: "r7", coordinate: CLLocationCoordinate2D(latitude: -6.30016, longitude: 106.65149), showMarker: false)
    static let r8 = sMarker(name: "r8", coordinate: CLLocationCoordinate2D(latitude: -6.30038, longitude: 106.65087), showMarker: false)
    static let r9 = sMarker(name: "B", coordinate: CLLocationCoordinate2D(latitude: -6.30112, longitude: 106.65056))
    static let r10 = sMarker(name: "r10", coordinate: CLLocationCoordinate2D(latitude: -6.30195, longitude: 106.65085), showMarker: false)
    static let r11 = sMarker(name: "r11", coordinate: CLLocationCoordinate2D(latitude: -6.30243, longitude: 106.65121), showMarker: false)
    static let r12 = sMarker(name: "r12", coordinate: CLLocationCoordinate2D(latitude: -6.30261, longitude: 106.65143), showMarker: false)
    static let r13 = sMarker(name: "A", coordinate: CLLocationCoordinate2D(latitude: -6.30278, longitude: 106.65176))
    static let r14 = sMarker(name: "r14", coordinate: CLLocationCoordinate2D(latitude: -6.30283, longitude: 106.65210), showMarker: false)
    static let r15 = sMarker(name: "A", coordinate: CLLocationCoordinate2D(latitude: -6.30211, longitude: 106.65289)) // mulai yg pendek
    static let r16 = sMarker(name: "r16", coordinate: CLLocationCoordinate2D(latitude: -6.30194, longitude: 106.65256), showMarker: false)
    static let rtlp1 = sMarker(name: "rtlp1", coordinate: CLLocationCoordinate2D(latitude: -6.30193, longitude: 106.65241), showMarker: false)
    static let r17 = sMarker(name: "r17", coordinate: CLLocationCoordinate2D(latitude: -6.30189, longitude: 106.65235), showMarker: false)
    static let r18 = sMarker(name: "r18", coordinate: CLLocationCoordinate2D(latitude: -6.30182, longitude: 106.65227), showMarker: false)
    static let r19 = sMarker(name: "r19", coordinate: CLLocationCoordinate2D(latitude: -6.30155, longitude: 106.65244), showMarker: false)
    static let r20 = sMarker(name: "r20", coordinate: CLLocationCoordinate2D(latitude: -6.30155, longitude: 106.65268), showMarker: false)
    static let r21 = sMarker(name: "r21", coordinate: CLLocationCoordinate2D(latitude: -6.30160, longitude: 106.65275), showMarker: false)
    static let r22 = sMarker(name: "B", coordinate: CLLocationCoordinate2D(latitude: -6.30162, longitude: 106.65298))
    static let r23 = sMarker(name: "A", coordinate: CLLocationCoordinate2D(latitude: -6.30162, longitude: 106.65297)) // rute dalem
    static let r24 = sMarker(name: "r24", coordinate: CLLocationCoordinate2D(latitude: -6.30209, longitude: 106.65285), showMarker: false)
    static let r25 = sMarker(name: "r25", coordinate: CLLocationCoordinate2D(latitude: -6.30194, longitude: 106.65256), showMarker: false)
    static let r26 = sMarker(name: "r26", coordinate: CLLocationCoordinate2D(latitude: -6.30193, longitude: 106.65241), showMarker: false)
    static let r27 = sMarker(name: "r27", coordinate: CLLocationCoordinate2D(latitude: -6.30189, longitude: 106.65235), showMarker: false)
    static let r28 = sMarker(name: "r28", coordinate: CLLocationCoordinate2D(latitude: -6.30182, longitude: 106.65227), showMarker: false)
    static let r29 = sMarker(name: "r29", coordinate: CLLocationCoordinate2D(latitude: -6.30192, longitude: 106.65209), showMarker: false)
    static let r30 = sMarker(name: "r30", coordinate: CLLocationCoordinate2D(latitude: -6.30195, longitude: 106.65173), showMarker: false)
    static let r31 = sMarker(name: "r31", coordinate: CLLocationCoordinate2D(latitude: -6.30187, longitude: 106.65155), showMarker: false)
    static let r32 = sMarker(name: "r32", coordinate: CLLocationCoordinate2D(latitude: -6.30188, longitude: 106.65136), showMarker: false)
    static let r33 = sMarker(name: "B", coordinate: CLLocationCoordinate2D(latitude: -6.30203, longitude: 106.65111))
    static let r34 = sMarker(name: "r34", coordinate: CLLocationCoordinate2D(latitude: -6.30195, longitude: 106.65085), showMarker: false)
    static let r35 = sMarker(name: "r35", coordinate: CLLocationCoordinate2D(latitude: -6.30112, longitude: 106.65056), showMarker: false)
    static let r36 = sMarker(name: "C", coordinate: CLLocationCoordinate2D(latitude: -6.30024, longitude: 106.65125))
    static let r37 = sMarker(name: "r37", coordinate: CLLocationCoordinate2D(latitude: -6.30081, longitude: 106.65139), showMarker: false)
    static let r38 = sMarker(name: "r38", coordinate: CLLocationCoordinate2D(latitude: -6.30124, longitude: 106.65197), showMarker: false)
    static let r39 = sMarker(name: "r39", coordinate: CLLocationCoordinate2D(latitude: -6.30143, longitude: 106.65216), showMarker: false)
    static let r40 = sMarker(name: "r40", coordinate: CLLocationCoordinate2D(latitude: -6.30153, longitude: 106.65225), showMarker: false)
    static let r41 = sMarker(name: "r41", coordinate: CLLocationCoordinate2D(latitude: -6.30155, longitude: 106.65232), showMarker: false)
    static let r42 = sMarker(name: "r42", coordinate: CLLocationCoordinate2D(latitude: -6.30155, longitude: 106.65244), showMarker: false)
    static let r43 = sMarker(name: "r43", coordinate: CLLocationCoordinate2D(latitude: -6.30155, longitude: 106.65268), showMarker: false)
    static let r44 = sMarker(name: "r44", coordinate: CLLocationCoordinate2D(latitude: -6.30160, longitude: 106.65275), showMarker: false)
    static let r45 = sMarker(name: "r45", coordinate: CLLocationCoordinate2D(latitude: -6.30162, longitude: 106.65297), showMarker: false)
}
