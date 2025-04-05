////
////  MapComponent.swift
////  Solari
////
////  Created by Ailsa Anarghia on 03/04/25.
////

import SwiftUI
import MapKit

struct MapComponent: View {
    @State private var showModalAlert = false
    @StateObject private var locationManager = MyLocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -6.301856, longitude: 106.651938),
        span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
    )
    @State private var showInfoSheet = false
    
    let walkingRoute: [CLLocationCoordinate2D]
    let titleText: String
    let infoText: String
    let showInfo: Bool
    let images: [String]
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .bottomTrailing) {
                PolylineMapView(region: $region, walkingRoute: walkingRoute)
                    .frame(width: 360, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(spacing: 10) {
                    Button(action: {
                        showInfoSheet = true
                    }) {
                        if showInfo {
                            Image(systemName: "info.circle")
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                        }
                    }
                    
                    Spacer()
                        .sheet(isPresented: $showInfoSheet) {
                            InfoModalView(titleText: titleText, infoText: infoText,images:images)
                                .presentationDetents([.medium]) // Half-screen modal
                                .presentationDragIndicator(.visible)
                        }

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
                .frame(height: 375)
                .padding()
            }
            .shadow(radius: 2, x: 0, y: 2)
        }
    }

    func zoomIn() {
        region.span.latitudeDelta /= 1.5
        region.span.longitudeDelta /= 1.5
    }

    func zoomOut() {
        region.span.latitudeDelta *= 1.5
        region.span.longitudeDelta *= 1.5
    }
}
#Preview {
    MapComponent(walkingRoute: [
        CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047),
        CLLocationCoordinate2D(latitude: -6.301446, longitude: 106.650716),
        CLLocationCoordinate2D(latitude: -6.300669, longitude: 106.652796),
        CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047)
        
    ], titleText: "title", infoText: "info", showInfo: false, images: ["SHORT1"])
}
