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
        
        _viewModel = StateObject(wrappedValue: RunProgressViewModel(
                    routeId: routeId,
                    myLocationManager: locationManager,
                    navigationManager: navManager
                ))
    }

    var body: some View {
        VStack(spacing: 10) {
            ProgressTitle()
                .padding(.top, 50)

            
            MapOptions(route: viewModel.route, selectedRouteId: .constant(nil))
                .padding()
                .frame(width: 380, height: 480)

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
        routeId: UUID(), startPointId: UUID(), runDataManager: .init(locationManager: .init()))
}
