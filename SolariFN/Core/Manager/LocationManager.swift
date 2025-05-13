//
//  LocationManager.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 04/05/25.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject,
    LocationRepository
{

    private let manager = CLLocationManager()
    @Published private(set) var authorizationStatus: CLAuthorizationStatus =
        .notDetermined
    var authorizationStatusPublisher: Published<CLAuthorizationStatus>.Publisher
    {
        $authorizationStatus
    }

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        self.authorizationStatus = manager.authorizationStatus
    }

    func requestAuthorization() {
        if manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        } else {
            self.authorizationStatus = manager.authorizationStatus
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse
            || manager.authorizationStatus == .authorizedAlways
        {
            manager.startUpdatingLocation()
        }
    }

    func registerMultipleRegions(_ locations: [CLLocationCoordinate2D]) {
        for location in locations {
            let region = CLCircularRegion(
                center: location, radius: 100, identifier: UUID().uuidString)
            region.notifyOnEntry = true
            manager.startMonitoring(for: region)
        }
    }
}
