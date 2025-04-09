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
    static let p1 = sMarker(name: "P1", coordinate: CLLocationCoordinate2D(latitude: -6.29440, longitude: 106.64116)) // 6,29440° S, 106,64116
    static let p2 = sMarker(name: "P2", coordinate: CLLocationCoordinate2D(latitude: -6.29424, longitude: 106.64158), showMarker: false) // 6,29424° S, 106,64158
    static let p3 = sMarker(name: "P3", coordinate: CLLocationCoordinate2D(latitude: -6.29459, longitude: 106.64176), showMarker: false) // 6,29459° S, 106,64176
    static let p4 = sMarker(name: "P4", coordinate: CLLocationCoordinate2D(latitude: -6.29511, longitude: 106.64186)) // 6,29511° S, 106,64186
    static let p5 = sMarker(name: "P5", coordinate: CLLocationCoordinate2D(latitude: -6.29527, longitude: 106.64128), showMarker: false) // 6,29527° S, 106,64128
    static let p6 = sMarker(name: "P6", coordinate: CLLocationCoordinate2D(latitude: -6.29543, longitude: 106.64078), showMarker: false) // 6,29543° S, 106,64078
    static let p7 = sMarker(name: "P7", coordinate: CLLocationCoordinate2D(latitude: -6.29447, longitude: 106.64057)) // 6,29447° S, 106,64057
}
