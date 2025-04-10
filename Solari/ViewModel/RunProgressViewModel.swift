//
//  RunProgressViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 07/04/25.
//

import CoreLocation
import Foundation
import SwiftUI

class RunProgressViewModel: MyLocationManager {

    private var progressRoute: solariRoute
    private var navigationManager: NavigationManager
    
    private var selectedStartPointId: UUID

    @Published var route: solariRoute
    @Published var runningRoutePoints: [sMarker] = []
    @Published var visitedPoints: [sMarker] = []
    private var loopingCount: Int = 0
    private var runIdx: Int = 0
    private var runningTargetPoints: [sMarker] = []
    private var preparedMarkers: [sMarker] = []

    init(
        routeId: UUID, startPointId: UUID,
        navigationManager: NavigationManager
    ) {
        self.navigationManager = NavigationManager()
        self.selectedStartPointId = startPointId

        progressRoute =
            routes.filter { $0.id == routeId }.first ?? routes.first!

        self.route = progressRoute
        self.loopingCount = progressRoute.looping

        if let tempIdx = progressRoute.markers.firstIndex(where: {
            $0.id == startPointId
        }) {
            let firstMarkers = Array(progressRoute.markers[..<tempIdx])
            let remainingMarkers = Array(progressRoute.markers[tempIdx...])
            let firstReversed = Array(firstMarkers.reversed())
            let concaated = remainingMarkers + firstReversed
            
            var finalMarkers: [sMarker] = remainingMarkers

            if progressRoute.looping > 0 {
                finalMarkers = concaated
            }
            self.preparedMarkers = finalMarkers
            print(finalMarkers)
            let startPoint = finalMarkers.first!
            self.runningRoutePoints = [startPoint]
            print("THE RUNNING POINTS, \([startPoint])")

        } else {
            print("Can't find route by id")
        }

    }

    func runVisitingPoint(_ point: sMarker) {
        self.visitedPoints.append(point)
    }

    override func locationManager(
        _ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]
    ) {
        
        guard let latestLocation: CLLocation = locations.last else {
            return
        }
        
        // TODO: SHOULD BE UNDER 8 METERS
        if self.visitedPoints.isEmpty {
            let distanceToNextPoint: Double = self.distanceToNextPoint(currentLocation: latestLocation)
            print("THE DISTANCE while visitedPoints empty IS \(distanceToNextPoint), \(self.visitedPoints.count), \(self.runningRoutePoints.count)")
            if (distanceToNextPoint < 20) {
                let latestMarker = self.runningRoutePoints.removeLast()
                self.visitedPoints.append(latestMarker)
                print("LATEST MARKER IS \(latestMarker)")
                
                let latesMarkerIdx = self.preparedMarkers.firstIndex(where: {$0.id == latestMarker.id})!
                print("LATEST MARKER IDX IS \(latesMarkerIdx)")
                
                if let nextPittMarker = self.preparedMarkers[(latesMarkerIdx + 1)...].first(where: {
                    $0.showMarker == true
                }) {
                    print("NEXT PITT MARKER FOUND \(nextPittMarker)")
                    self.runningRoutePoints.append(nextPittMarker)
                }
                
                print("NEX PITT MARKER NOT FOUND")
                
            }
            return
        }
        
        let distanceToNextPoint: Double = self.distanceToNextPoint(currentLocation: latestLocation)
        print("Visited not empty && THE DISTANCE IS \(distanceToNextPoint), \(self.visitedPoints.count), \(self.runningRoutePoints.count)")
        if distanceToNextPoint < 20 {
            let latestMarker: sMarker = self.runningRoutePoints.removeLast()
            self.visitedPoints.append(latestMarker)
            
            let latesMarkerIdx = self.preparedMarkers.firstIndex(where: {$0.id == latestMarker.id})!
            
            if let nextPittMarker = self.preparedMarkers[(latesMarkerIdx + 1)...].first(where: {
                $0.showMarker == true
            }) {
                self.runningRoutePoints.append(nextPittMarker)
            }
        }
        // Ensure run on main thread
//        DispatchQueue.main.async { [weak self] in
//
//        }
    }

    private func distanceToNextPoint(currentLocation: CLLocation) -> Double {

        // TODO: OUR SPECIFIC RUNNING LOCATION
        // TODO: You can test on ur own location
        let latestMarker: sMarker = self.runningRoutePoints.last!
        
        guard let latesMarkerIdx = self.preparedMarkers.firstIndex(where: {$0.id == latestMarker.id}) else {
            print("TRY TO GET THE LATEST MARKER IDX")
            return 90.0
        }
        
        if let nextPittMarker = self.preparedMarkers[(latesMarkerIdx + 1)...].first(where: {
            $0.showMarker == true
        }) {
            
            let listPoint = self.preparedMarkers[(latesMarkerIdx + 1)...]
            print("THE LIST POINT: \(listPoint)")
            
            let distance = calcDistance(from: currentLocation, to: nextPittMarker.coordinate)
            
            return distance
        } else {
            print("LATEST MARKER IS NOT SHOW")
            return 90.0
        }
        
    }
    
    private func calcDistance(from start: CLLocation, to end: CLLocationCoordinate2D) -> Double {
        let latitude: Double = end.latitude
        let longitude: Double = end.longitude
        
        let pointCoordinate = CLLocation(
            latitude: latitude, longitude: longitude)
        
        return start.distance(from: pointCoordinate)
    }

}
