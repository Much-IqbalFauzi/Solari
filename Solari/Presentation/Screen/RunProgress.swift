//
//  RunProgress.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import MapKit
import SwiftUI

struct RunProgressScreen: View {
    var routeId: UUID
    var startPointId: UUID
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var locationManager = MyLocationManager()
    @ObservedObject var runDataManager: RunDataManager
    @State private var showingStopAlert = false
    @StateObject private var viewModel: RunProgressViewModel

    init(routeId: UUID, startPointId: UUID, runDataManager: RunDataManager) {
        self.startPointId = startPointId
        self.routeId = routeId
        self.runDataManager = runDataManager
        let navManager = NavigationManager()
        let locationManager = MyLocationManager()

        _viewModel = StateObject(
            wrappedValue: RunProgressViewModel(
                routeId: routeId,
                startPointId: startPointId,
                myLocationManager: locationManager,
                navigationManager: navManager
            ))
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ProgressTitle(title: viewModel.route.name)
                    .padding(.top, 40)

//                MapOptions(
//                    route: viewModel.route, selectedRouteId: .constant(nil)
//                )
//                .padding()
//                .frame(width: 380, height: 420)
                Map(
                    interactionModes: [.zoom]
                ) {
//                    MapPolyline(
//                        coordinates: [locationManager.currentLocation?.coordinate]
//                    )
//                    .stroke(.blue, lineWidth: 8.0)

                    ForEach(viewModel.route.markers.indices, id: \.self) { idx in
                        let marker = viewModel.route.markers[idx]
                        if marker.showMarker {
                            Marker(
                                marker.name,
                                systemImage: "figure.run.circle.fill",
                                coordinate: marker.coordinate
                            )
                            .tint(.blue)
                        }
                    }
                }
                .cornerRadius(15)
                .shadow(radius: 4)
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .frame(width: 380, height: 420)

                Spacer()
                RunMetricsRow(
                    duration: runDataManager.formattedElapsedTime,
                    distance: String(
                        format: "%.2f km",
                        runDataManager.distanceTraveled / 1000),
                    pace: runDataManager.formattedPace
                )
                RunControlButtons(
                    runDataManager: runDataManager,
                    showingStopAlert: $showingStopAlert)
            }
            .onReceive(locationManager.$currentLocation.compactMap { $0 }) {
                location in
                runDataManager.updateLocation(location)
            }
            .onAppear {
                runDataManager.startRun()
            }
            .padding(.bottom, 100)
        }

    }
}

#Preview {
    RunProgressScreen(
        routeId: UUID(), startPointId: UUID(),
        runDataManager: .init(locationManager: .init()))
}
