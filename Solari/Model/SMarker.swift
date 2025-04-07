//
//  SMarker.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 03/04/25.
//

import MapKit
import Foundation

struct sMarker {
    var id: UUID = UUID()
    var name: String
    var showMarker: Bool = true
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D, showMarker: Bool = true) {
        self.name = name
        self.coordinate = coordinate
        self.showMarker = showMarker
    }
}
