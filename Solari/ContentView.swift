//
//  ContentView.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationManager = NavigationManager()
    @StateObject private var locationManager = MyLocationManager()
    @StateObject var runDataManager: RunDataManager
//    @Environment(\.modelContext) private var modelContext
    
    init() {
        let locationManager = MyLocationManager()
        _locationManager = StateObject(wrappedValue: locationManager)
        _runDataManager = StateObject(wrappedValue: RunDataManager(locationManager: locationManager))
    }
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            HomeScreen()
                .navigationDestination(for: RouteNav.self) { route in
                    switch route {
                    case .home:
                        HomeScreen()
                    case .startPoint:
                        RouteStartPointScreen(
                            locationManager: locationManager,
                            navigationManager: navigationManager
                        )
                    case .startProgress(let routeId):
                        RunProgressScreen(routeId: routeId, runDataManager: runDataManager)
                    case .summary:
                        SummaryScreen(runDataManager: runDataManager)
                            .navigationBarBackButtonHidden(true)
                            .interactiveDismissDisabled(true)
                    }
                }
        }
        .environmentObject(navigationManager)
    }
}

#Preview {
    ContentView()
}
