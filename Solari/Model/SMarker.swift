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
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
}
