//
//  HomeNotification.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 04/04/25.
//

import SwiftUI
import CoreLocation

class RunDataManager: ObservableObject {
    @Published var isRunning = false
    @Published var isPaused = false
    @Published var elapsedTime: TimeInterval = 0
    @Published var distanceTraveled: Double = 0.0
    @Published var currentPace: Double = 0.0  // minutes per km

    private var locationManager: MyLocationManager
    private var lastLocation: CLLocation?
    private var timer: Timer?
    private var startTime: Date?
    private(set) var locationHistory: [CLLocation] = []

    /// Injected from outside to allow SwiftData save
    var onSave: ((RunSession) -> Void)?

    init(locationManager: MyLocationManager) {
        self.locationManager = locationManager
    }
    
    func startTrackingLocation() {
        lastLocation = locationManager.currentLocation
    }


    func startRun() {
        isRunning = true
        isPaused = false
        startTime = Date()
        lastLocation = locationManager.currentLocation

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self, let startTime = self.startTime else { return }
            self.elapsedTime = Date().timeIntervalSince(startTime)
        }
    }

    func pauseRun() {
        isPaused = true
        timer?.invalidate()
    }

    func resumeRun() {
        isPaused = false
        startTime = Date().addingTimeInterval(-elapsedTime)

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self, let startTime = self.startTime else { return }
            self.elapsedTime = Date().timeIntervalSince(startTime)
        }
    }

    func cancelRun() {
        isRunning = false
        timer?.invalidate()
        resetTracking()
    }

    func stopRun() {
        isRunning = false
        timer?.invalidate()
        saveRunSession()
        resetTracking()
    }

    private func resetTracking() {
        elapsedTime = 0
        distanceTraveled = 0
        currentPace = 0
        lastLocation = nil
        isPaused = false
    }
    
    func resetLocationHistory() {
        locationHistory = []
    }

    private func saveRunSession() {
        let run = RunSession(
            date: Date(),
            duration: elapsedTime,
            distance: distanceTraveled,
            pace: currentPace
        )
        
        // Print each value before saving
        print("Saving RunSession:")
        print("Date: \(run.date)")
        print("Duration (seconds): \(run.duration)")
        print("Distance (meters): \(run.distance)")
        print("Pace (min/km): \(run.pace)")

        onSave?(run)
    }

    func updateLocation(_ location: CLLocation) {
        guard isRunning && !isPaused else { return }

        if let last = lastLocation {
            let distance = location.distance(from: last)
            distanceTraveled += distance
            currentPace = distanceTraveled > 0 ? elapsedTime / (distanceTraveled / 1000) : 0
        }
        
        locationHistory.append(location)
        lastLocation = location
    }
    
    func formatPaceString(distance: Double, time: TimeInterval) -> String {
        guard distance > 0 else { return "0:00" }

        let paceInSecondsPerKm = time / (distance / 1000) // seconds per km
        let minutes = Int(paceInSecondsPerKm) / 60
        let seconds = Int(paceInSecondsPerKm) % 60

        return String(format: "%d:%02d", minutes, seconds)
    }
    
    func formatDistanceInKM(_ distance: Double) -> String {
        let distanceInKM = distance / 1000
        return String(format: "%.2f", distanceInKM)
    }
    
    func formatDuration(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func formatDurationInDecimalMinutes(_ time: TimeInterval) -> String {
        let minutes = time / 60.0
        return String(format: "%.2f min", minutes)
    }
}

extension RunDataManager {
    
    var formattedElapsedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var formattedResultTime: String {
        let minutes = Int(elapsedTime)/60
        return String(minutes)
    }

    var formattedPace: String {
        guard distanceTraveled > 0 else { return "0:00" }
        let paceInSecondsPerKm = elapsedTime / (distanceTraveled / 1000)
        let minutes = Int(paceInSecondsPerKm) / 60
        let seconds = Int(paceInSecondsPerKm) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    var locationCoordinates: [CLLocation] {
        locationHistory
    }
    
}
