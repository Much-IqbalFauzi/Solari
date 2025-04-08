////
////  MapComponent.swift
////  Solari
////
////  Created by Ailsa Anarghia on 03/04/25.
////

import SwiftUI
import MapKit


struct MapComponent: View {
    let route: solariRoute
    @State private var scale: Double = 340
    @Binding var selectedRouteId: UUID?
    
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -6.30147, longitude: 106.65196),
            latitudinalMeters: 340,
            longitudinalMeters: 340
        )
    )
    private func zoom(factor: Double) {
        scale *= factor
        cameraPosition = .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: -6.30147, longitude: 106.65196),
                latitudinalMeters: scale,
                longitudinalMeters: scale
            )
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(position: $cameraPosition, interactionModes: [.zoom], selection: $selectedRouteId) {
                MapPolyline(
                    coordinates: route.markers.compactMap {
                        $0.coordinate
                    }
                )
                .stroke(.blue, lineWidth: 8.0)
                ForEach(
                    Array(
                        route.markers.enumerated()),
                    id: \.offset
                ) { idx, marker in
                    
                    if marker.showMarker {
                        Marker(
                            marker.name,
                            systemImage:
                                "figure.run.circle.fill",
                            coordinate: marker
                                .coordinate
                        ).tint(
                            selectedRouteId
                            == marker.id
                            ? .orange : .blue)
                    }
                }
            }.cornerRadius(15)
                .shadow(radius: 4)
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
            
            VStack(spacing: 13) {
                Button {
                    zoom(factor: 0.8)
                } label: {
                    Image(systemName: "plus.magnifyingglass")
                        .frame(width: 10, height: 10)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
                
                Button {
                    zoom(factor: 1.25)
                } label: {
                    Image(systemName: "minus.magnifyingglass")
                        .frame(width: 10, height: 10)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
            }
            .padding([.bottom, .trailing], 18)
        }
    }
}
//struct MapComponent: View {
//    @State private var showModalAlert = false
//    @StateObject private var locationManager = MyLocationManager()
//
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: -6.301856, longitude: 106.651938),
//        span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
//    )
//    @State private var showInfoSheet = false
//    
//    let walkingRoute: [CLLocationCoordinate2D]
//    let titleText: String
//    let infoText: String
//    let showInfo: Bool
//    let images: [String]
//    
//    var body: some View {
//        VStack(spacing: 10) {
//            ZStack(alignment: .bottomTrailing) {
//                PolylineMapView(region: $region, walkingRoute: walkingRoute)
//                    .frame(width: 360, height: 400)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                
//                VStack(spacing: 10) {
//                    Button(action: {
//                        showInfoSheet = true
//                    }) {
//                        if showInfo {
//                            Image(systemName: "info.circle")
//                                .padding()
//                                .background(Color.white.opacity(0.8))
//                                .clipShape(Circle())
//                        }
//                    }
//                    
//                    Spacer()
//                        .sheet(isPresented: $showInfoSheet) {
//                            InfoModalView(titleText: titleText, infoText: infoText,images:images)
//                                .presentationDetents([.medium]) // Half-screen modal
//                                .presentationDragIndicator(.visible)
//                        }
//
//                    Button(action: zoomIn) {
//                        Image(systemName: "plus.magnifyingglass")
//                            .padding()
//                            .background(Color.white.opacity(0.8))
//                            .clipShape(Circle())
//                    }
//
//                    Button(action: zoomOut) {
//                        Image(systemName: "minus.magnifyingglass")
//                            .padding()
//                            .background(Color.white.opacity(0.8))
//                            .clipShape(Circle())
//                    }
//                }
//                .frame(height: 375)
//                .padding()
//            }
//            .shadow(radius: 2, x: 0, y: 2)
//        }
//    }
//
//    func zoomIn() {
//        region.span.latitudeDelta /= 1.5
//        region.span.longitudeDelta /= 1.5
//    }
//
//    func zoomOut() {
//        region.span.latitudeDelta *= 1.5
//        region.span.longitudeDelta *= 1.5
//    }
//}
//#Preview {
//    MapComponent(walkingRoute: [
//        CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047),
//        CLLocationCoordinate2D(latitude: -6.301446, longitude: 106.650716),
//        CLLocationCoordinate2D(latitude: -6.300669, longitude: 106.652796),
//        CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047)
//        
//    ], titleText: "title", infoText: "info", showInfo: false, images: ["SHORT1"])
//}
