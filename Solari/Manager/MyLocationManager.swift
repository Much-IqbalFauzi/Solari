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
    @Published var distance: Double?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        requestLocationPermission()
    }
    
    private func requestLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
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
            break
        @unknown default:
            print("Unknown authorization status")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        
        // Ensure run on main thread
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
        
        // TODO: OUR SPECIFIC RUNNING LOCATION
        // TODO: You can test on ur own location
        let latitude: Double = -7.410047832999287
        let longitude: Double =  109.43366802976672
        
        // TODO: RADIUS ON OUR RUNNING LOCATION
        let radius: Double = 3000
        
        let pointCoordinate = CLLocation(latitude: latitude, longitude: longitude)
        distance = currentLocation.distance(from: pointCoordinate)
        
        isNearLocation = distance ?? 0 <= radius
        
        print("Current Location: \(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)")
        print("Distance to Target: \(distance ?? 0) meters")
        print("Is Near: \(isNearLocation)")
    }
}
