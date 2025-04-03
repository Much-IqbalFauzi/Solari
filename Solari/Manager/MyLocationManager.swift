//
//  LocationManager.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 29/03/25.
//
import CoreLocation

class MyLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var currentLocation: CLLocation?
    @Published var isNearLocation: Bool = false
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        requestLocationPermission()
    }
    
    private func requestLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.startUpdatingLocation()
            default:
                print("Location access denied")
            }
        } else {
            print("Location services are disabled")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Location access granted")
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location access denied")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            print("Unknown authorization status")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.currentLocation = latestLocation
            self?.updateDistance()
        }
    }
    
    private func updateDistance() {
        guard let currentLocation = currentLocation else {
            print("Current location is nil")
            isNearLocation = false
            return
        }

        let targetLocation = CLLocation(latitude: -7.410047832999287, longitude: 109.43366802976672)
        let distance = currentLocation.distance(from: targetLocation)
        
        isNearLocation = distance <= 3000
        
        print("Current Location: \(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)")
        print("Distance to Target: \(distance) meters")
        print("Is Near: \(isNearLocation)")
    }
}
