//
//  MapComponent.swift
//  Solari
//
//  Created by Ailsa Anarghia on 03/04/25.
//

import SwiftUI
import MapKit

struct MapComponent: View {
    @State private var showModalAlert = false
    @StateObject private var locationManager = MyLocationManager()
    
    // Define the region for the map with correct initialization for latitudinal/longitudinal meters
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -6.303056, longitude:106.652138), // Default to San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // This will need to be converted to meters
    )
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .bottomTrailing) {
                Map(coordinateRegion: $region, interactionModes: [.zoom], showsUserLocation: true)
                    .frame(width: 360, height: 400) // Large upper component
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(spacing: 10) {
                                    Button(action: zoomIn) {
                                        Image(systemName: "plus.magnifyingglass")
                                            .padding()
                                            .background(Color.white.opacity(0.8))
                                            .clipShape(Circle())
                                    }
                                    Button(action: zoomOut) {
                                        Image(systemName: "minus.magnifyingglass")
                                            .padding()
                                            .background(Color.white.opacity(0.8))
                                            .clipShape(Circle())
                                    }
                                }
                                .padding()
                
            }
            .shadow(radius: 2, x: 0, y: 2)
        }
    }
    
    // Zoom In Function
    func zoomIn() {
        region.span.latitudeDelta /= 1.5
        region.span.longitudeDelta /= 1.5
    }
    
    // Zoom Out Function
    func zoomOut() {
        region.span.latitudeDelta *= 1.5
        region.span.longitudeDelta *= 1.5
    }
}

#Preview {
    MapComponent()
}
