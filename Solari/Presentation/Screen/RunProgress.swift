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
                navigationManager: navManager
            ))
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ProgressTitle(title: viewModel.route.name)

                Map(
                    interactionModes: [.zoom]
                ) {
                    MapPolyline(
                        coordinates: viewModel.route.markers.compactMap {
                            $0.coordinate
                        }
                    )
                    .stroke(.blue, lineWidth: 8.0)
                    UserAnnotation()
                        .stroke(Color.red, lineWidth: 8.0)
                        .mapOverlayLevel(level: MKOverlayLevel.aboveRoads)
                        .tint(Color.greenYellow)

                    //TODO: NEXT POINT MARKER
                    ForEach(
                        Array(viewModel.runningRoutePoints.enumerated()),
                        id: \.offset
                    ) { idx, point in
                        Marker(
                            point.name,
                            systemImage: "figure.run.circle.fill",
                            coordinate: point.coordinate
                        )
                        .tint(Color.greenYellow)
                    }

                    ForEach(viewModel.route.markers.indices, id: \.self) {
                        idx in
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

                //                RunMetricCard(title: "Your next destination:", value: viewModel.runningRoutePoints.last?.name ?? "Unknown")
                //                Spacer()
                RunMetricsRow(
                    duration: runDataManager.formattedElapsedTime,
                    distance: String(
                        format: "%.2f km",
                        runDataManager.distanceTraveled / 1000),
                    pace: runDataManager.formattedPace
                )
                RunControlButtons(
                    runDataManager: runDataManager,
                    showingStopAlert: $showingStopAlert,
                    cancel: {
                        runDataManager.cancelRun()
                        navigationManager.reset()
                    },
                    finish: {
                        runDataManager.stopRun()
                        navigationManager.navigate(
                            to: .summary(routeId: routeId), with: runDataManager)
                    })
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

//#Preview {
//    RunProgressScreen(
//        routeId: UUID(), startPointId: UUID(),
//        runDataManager: .init(locationManager: .init()))
//}
