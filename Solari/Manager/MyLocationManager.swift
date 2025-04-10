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
    @Published var userLocation2D: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            locationManager.requestWhenInUseAuthorization()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            print("Unknown authorization status")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        
        // Ensure run on main thread
        DispatchQueue.main.async { [weak self] in
            self?.currentLocation = latestLocation
            self?.userLocation2D = CLLocationCoordinate2D(latitude: latestLocation.coordinate.latitude, longitude: latestLocation.coordinate.longitude)
            self?.updateDistance()
        }
    }
    
    private func updateDistance() {
        guard let currentLocation = currentLocation else {
            isNearLocation = false
            return
        }
        
        self.userLocation2D = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        
        // TODO: OUR SPECIFIC RUNNING LOCATION
        // TODO: You can test on ur own location
        // lat and long for Apple Developer Academy
        //-6.302166926529757, 106.6525604638018
        let latitude: Double = -6.302166926529757
        let longitude: Double =   106.6525604638018
        
        // TODO: RADIUS ON OUR RUNNING LOCATION
        let radius: Double = 5000
        
        let pointCoordinate = CLLocation(latitude: latitude, longitude: longitude)
        distance = currentLocation.distance(from: pointCoordinate)
        
        isNearLocation = distance ?? 0 <= radius
        
//        print("Current Location: \(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)")
//        print("Distance to Target: \(distance ?? 0) meters")
//        print("Is Near: \(isNearLocation)")
    }
}
