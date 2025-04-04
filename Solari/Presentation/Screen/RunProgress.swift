//
//  RunProgress.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct RunProgressScreen: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var locationManager = MyLocationManager()
    @ObservedObject var runDataManager: RunDataManager
    @State private var showingStopAlert = false

    var body: some View {
        VStack(spacing: 10) {
            Text("Your Run Progress")
                        .font(.title)
                        .bold()
            
            Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 380, height: 500)
                        .overlay(Text("Map goes here"))
            
            Spacer()
            RunMetricsRow(
                duration: runDataManager.formattedElapsedTime,
                distance: String(format: "%.2f km", runDataManager.distanceTraveled / 1000),
                pace: runDataManager.formattedPace
            )
            RunControlButtons(runDataManager: runDataManager, showingStopAlert: $showingStopAlert)
        }
        .onReceive(locationManager.$currentLocation.compactMap { $0 }) { location in
            runDataManager.updateLocation(location)
        }
        .onAppear {
            runDataManager.startRun()
        }
    }
}

#Preview {
    RunProgressScreen(runDataManager: .init(locationManager: .init()))
}
