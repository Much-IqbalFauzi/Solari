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
    
    @Published var listRoute: [solariRoute]
    @Published var selectedIndex = 0
    @Published var selectedRouteId: UUID?
    @Published var selectedStartPoint: UUID?
    @Published var mapRegion: MKCoordinateRegion
    @Published var isNearAlertShown: Bool = false
    @Published var isStartPointSelected: Bool = false
    
    
    
    init(locationManager: MyLocationManager, navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
        self.listRoute = routes
        self.mapRegion = mapStaticRegion
    }

    func navigateRunProgressHandler() {
       let selectedRouteId = self.listRoute[selectedIndex].id
        guard let selectedStartPointId = self.selectedStartPoint else {
            return
        }
        navigationManager.navigate(to: .startProgress(routeId: selectedRouteId, startPointId: selectedStartPointId))
    }
    
    func resetRouteStartPoint() {
        self.selectedStartPoint = nil
    }
}
