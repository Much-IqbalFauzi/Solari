//
//  AppDependencies.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 18/05/25.
//

import Foundation
import Combine

class AppDependencies: ObservableObject {
    static let shared = AppDependencies()

    let locationManager: LocationManager
//    let dataRepository: DataRepository
    let motionManager: MotionManager

    private init() {
        self.locationManager = LocationManager()
        self.motionManager = MotionManager()
//        self.dataRepository = SwiftDataRepository()
    }
}
