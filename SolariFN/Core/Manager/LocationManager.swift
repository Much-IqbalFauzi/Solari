//
//  LocationManager.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 04/05/25.
//

import Combine
import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject,
    LocationRepository
{

    private let manager = CLLocationManager()
    @Published private(set) var authorizationStatus: CLAuthorizationStatus =
        .notDetermined

    @Published var enteredRegionIdentifier: String?

    let regionEntrySubject = PassthroughSubject<String, Never>()

    var authorizationStatusPublisher: Published<CLAuthorizationStatus>.Publisher
    {
        $authorizationStatus
    }
    var enteredRegionPublisher: Published<String?>.Publisher {
        $enteredRegionIdentifier
    }
    var regionEntryPublisher: AnyPublisher<String, Never> {
        regionEntrySubject.eraseToAnyPublisher()
    }

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        self.authorizationStatus = manager.authorizationStatus
    }

    func requestAuthorization() {
        if manager.authorizationStatus == .notDetermined {
//            manager.requestWhenInUseAuthorization()
            manager.requestAlwaysAuthorization()
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

//    func registerMultipleRegions(_ markers: [SMarker]) {
//        print("Register multiple regions")
//        for marker in markers {
//            let region = CLCircularRegion(
//                center: marker.coordinate, radius: 5, identifier: marker.name)
//            region.notifyOnEntry = true
//            manager.startMonitoring(for: region)
//
//            if let currentLocation = manager.location,
//                region.contains(currentLocation.coordinate)
//            {
//                regionEntrySubject.send(region.identifier)
//            }
//        }
//    }

    func locationManager(
        _ manager: CLLocationManager, didEnterRegion region: CLRegion
    ) {
        if let circular = region as? CLCircularRegion {
            print("ENTEYED REGION: \(circular.identifier)")
            regionEntrySubject.send(circular.identifier)
        }
    }

}
