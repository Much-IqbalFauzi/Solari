//
//  RunProgressViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 07/04/25.
//

import Foundation
import SwiftUI

class RunProgressViewModel: ObservableObject {
    
    private var progressRoute: solariRoute
    private var navigationManager: NavigationManager
    private var locationManager: MyLocationManager
    private var runDataManager: RunDataManager?
    
    init(routeId: UUID, myLocationManager: MyLocationManager, navigationManager: NavigationManager) {
        locationManager = myLocationManager
        self.navigationManager = NavigationManager()
        let manager = RunDataManager(locationManager: myLocationManager)
        manager.startTrackingLocation()
        manager.startRun()
        runDataManager = manager
        progressRoute = routes.filter { $0.id == routeId }.first ?? routes.first!
        print(progressRoute.name)
    }
}
