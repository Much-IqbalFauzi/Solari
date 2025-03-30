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
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            print ("auth always granted")
            break
        case .authorizedWhenInUse:
            print ("auth when in use granted")
            break
        default:
            manager.requestWhenInUseAuthorization()
            print ("auth denied")
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = manager.location
    }
        
    func distanceLocation() -> (Double, Bool) {
        let currentLocation = CLLocation(latitude: currentLocation?.coordinate.latitude ?? -7, longitude: currentLocation?.coordinate.longitude ?? 110)
        
        // TODO: OUR SPECIFIC RUNNING LOCATION
        // TODO: You can test on ur own location
        let latitude: Double = -7.313198
        let longitude: Double = 110.481128
        
        // TODO: RADIUS ON OUR RUNNING LOCATION
        let radius: Double = 5
        let pointCoordinate = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        
        let distance: Double =  currentLocation.distance(from: pointCoordinate)
        let isNearLocation: Bool = distance <= radius
        return (distance, isNearLocation)
    }
}
