//
//  RouteShape.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 17/05/25.
//

import SwiftUI
import CoreLocation

struct RouteShape: Shape {
    let coordinates: [CLLocationCoordinate2D]
    
    func path(in rect: CGRect) -> Path {
        guard coordinates.count > 1 else { return Path() }

        // Normalize coordinates to fit in rect
        let latitudes = coordinates.map { $0.latitude }
        let longitudes = coordinates.map { $0.longitude }
        
        guard let minLat = latitudes.min(),
              let maxLat = latitudes.max(),
              let minLon = longitudes.min(),
              let maxLon = longitudes.max(),
              minLat != maxLat, minLon != maxLon else {
            return Path()
        }
        
        // Scale function to fit the map into the rect
        let latDelta = maxLat - minLat
        let lonDelta = maxLon - minLon
        
        func convert(_ coordinate: CLLocationCoordinate2D) -> CGPoint {
            let x = (coordinate.longitude - minLon) / lonDelta * rect.width
            let y = rect.height - (coordinate.latitude - minLat) / latDelta * rect.height
            return CGPoint(x: x, y: y)
        }

        var path = Path()
        path.move(to: convert(coordinates[0]))
        for coord in coordinates.dropFirst() {
            path.addLine(to: convert(coord))
        }

        return path
    }
}
