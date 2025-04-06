//
//  SelectRouteViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 03/04/25.
//

import Foundation
import MapKit

class SelectRouteViewModel: ObservableObject {
    private var navigationManager: NavigationManager
    private var locationManager: MyLocationManager
    private var runDataManager: RunDataManager?
    
    @Published var listRoute: [solariRoute]
    @Published var selectedIndex = 0
    @Published var selectedRouteId: UUID?
    @Published var mapRegion: MKCoordinateRegion
    
    
    
    init(locationManager: MyLocationManager, navigationManager: NavigationManager) {
        self.locationManager = locationManager
        self.navigationManager = navigationManager
        self.runDataManager = RunDataManager(locationManager: locationManager)
        self.listRoute = routes
        self.mapRegion = mapStaticRegion
    }

    func navigateRunProgressHandler() {
        let manager = RunDataManager(locationManager: locationManager)
        manager.startTrackingLocation()
        manager.startRun()
        runDataManager = manager
        navigationManager.navigate(to: .startProgress)
    }
}
