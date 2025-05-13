//
//  MotionManager.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 07/05/25.
//

import CoreMotion

class MotionManager: MotionRepository {
    private let motionManager = CMMotionActivityManager()

    func startTracking() {
        if CMMotionActivityManager.isActivityAvailable() {
            motionManager.startActivityUpdates(to: .main) { activity in
                // Handle activity updates if needed
            }
        }
    }
}
