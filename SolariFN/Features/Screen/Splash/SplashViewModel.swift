//
//  SplashViewModel.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 07/05/25.
//

import Combine
import CoreLocation
import Foundation
import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var log: [String] = []
    @Published var logText: String = ""
    @Published var isReady: Bool = false

    private let locationRepo: LocationRepository
    private let motionRepo: MotionRepository
    //    private let dataRepository: DataRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        locationRepository: LocationRepository,
        motionRepository: MotionRepository
            //        dataRepository: DataRepository
    ) {
        self.locationRepo = locationRepository
        self.motionRepo = motionRepository
        //        self.dataRepository = dataRepository

        //        initialize()
        setupAuthorizationFlow()
        locationRepo.requestAuthorization()
    }

    private func setupAuthorizationFlow() {
        locationRepo.authorizationStatusPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                guard let self = self else { return }
                switch status {
                case .authorizedAlways, .authorizedWhenInUse:
                    self.startInitialization()
                case .denied, .restricted:
                    self.logStep("Location permission denied.")
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }

    private func logStep(_ text: String) {
        DispatchQueue.main.async {
            self.log.append(text)
            self.logText = text
        }
    }

    private func startInitialization() {
        logStep("Registering geofences...")
        let testLocations = [
            CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
        ]
        locationRepo.registerMultipleRegions(testLocations)

        logStep("Starting motion tracking...")
        motionRepo.startTracking()

        logStep("Loading app data...")
        //            dataRepository.loadInitialData()

        logStep("Initialization complete.")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isReady = true
        }
    }
}
