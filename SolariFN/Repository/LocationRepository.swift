//
//  LocationRepository.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 07/05/25.
//

import CoreLocation

protocol LocationRepository {
    var authorizationStatusPublisher: Published<CLAuthorizationStatus>.Publisher
    { get }
    func requestAuthorization()
    func registerMultipleRegions(_ locations: [CLLocationCoordinate2D])
}
