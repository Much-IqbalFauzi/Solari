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
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var locationManager = MyLocationManager()
    @ObservedObject var runDataManager: RunDataManager
    @State private var showingStopAlert = false

//    @StateObject var viewModel: RunProgressViewModel

    init(routeId: UUID, runDataManager: RunDataManager) {
        self.routeId = routeId
        self.runDataManager = runDataManager
//        _viewModel = .init(wrappedValue: RunProgressViewModel(routeId: routeId, runDataManager: runDataManager, locationManager: locationManager))
    }

    var body: some View {
        VStack(spacing: 10) {
            ProgressTitle()
                .padding(.top, 50)

            //tambahin map based on routes yg mereka pilih, trus bisa ada titik2 gerak itu

            //            MapComponent(walkingRoute:   CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047),
            //                         CLLocationCoordinate2D(latitude: -6.301446, longitude: 106.650716),
            //                         CLLocationCoordinate2D(latitude: -6.300669, longitude: 106.652796),
            //                         CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047), titleText: "title", infoText: "info", showInfo: false, images: [""])

            Spacer()
            RunMetricsRow(
                duration: runDataManager.formattedElapsedTime,
                distance: String(
                    format: "%.2f km", runDataManager.distanceTraveled / 1000),
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

#Preview {
    RunProgressScreen(
        routeId: UUID(), runDataManager: .init(locationManager: .init()))
}
