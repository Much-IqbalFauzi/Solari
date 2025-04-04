//
//  SelectRouteViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 03/04/25.
//

import SwiftUI


class SelectRouteViewModel: ObservableObject {
    
    @State private var runDataManager: RunDataManager? = nil
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var locationManager: MyLocationManager //= MyLocationManager()
    
    init(locationManager: MyLocationManager) {
        runDataManager = RunDataManager(locationManager: locationManager)
        self.locationManager = locationManager
    }
    
    
    func navigateRunProgressHandler() {
        let manager = RunDataManager(locationManager: locationManager)
        manager.startTrackingLocation()
        manager.startRun()
        runDataManager = manager
        navigationManager.navigate(to: .startProgress)
    }
    
    
}
