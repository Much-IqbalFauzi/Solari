//
//  MapOptions.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 08/04/25.
//

import SwiftUI
import MapKit

struct MapOptions: View {
    let route: solariRoute
    @Binding var selectedRouteId: UUID?

    var body: some View {
        Map(
            interactionModes: [.zoom],
            selection: $selectedRouteId
        ) {
            MapPolyline(
                coordinates: route.markers.compactMap {
                    $0.coordinate
                }
            )
            .stroke(.blue, lineWidth: 2.0)

            ForEach(route.markers.indices, id: \.self) { idx in
                let marker = route.markers[idx]
                if marker.showMarker {
                    Marker(
                        marker.name,
                        systemImage: "figure.run.circle.fill",
                        coordinate: marker.coordinate
                    )
                    .tint(selectedRouteId == marker.id ? .orange : .blue)
                }
            }
        }
        .cornerRadius(15)
        .shadow(radius: 4)
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
    }
}

