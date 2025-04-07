//
//  MapContent.swift
//  Solari
//
//  Created by Ailsa Anarghia on 07/04/25.
//

import SwiftUI
import MapKit

struct StaticMapView: View {
    @Binding var region: MKCoordinateRegion


    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(coordinateRegion: $region, interactionModes: [])
                .frame(width: 360, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 2, x: 0, y: 2)
                .padding()

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
    }

    private func zoomIn() {
        region.span.latitudeDelta /= 1.5
        region.span.longitudeDelta /= 1.5
    }

    private func zoomOut() {
        region.span.latitudeDelta *= 1.5
        region.span.longitudeDelta *= 1.5
    }
}

#Preview {
//    StaticMapView(/*regi*/)
}
