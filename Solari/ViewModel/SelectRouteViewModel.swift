//
//  SelectRouteViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 03/04/25.
//

import Foundation

class SelectRouteViewModel: ObservableObject {
    private var navigationManager: NavigationManager
    private var locationManager: MyLocationManager
    private var runDataManager: RunDataManager?

    init(locationManager: MyLocationManager, navigationManager: NavigationManager) {
        self.locationManager = locationManager
        self.navigationManager = navigationManager
        self.runDataManager = RunDataManager(locationManager: locationManager)
    }

    func navigateRunProgressHandler() {
        let manager = RunDataManager(locationManager: locationManager)
        manager.startTrackingLocation()
        manager.startRun()
        runDataManager = manager
        navigationManager.navigate(to: .startProgress)
    }
}
