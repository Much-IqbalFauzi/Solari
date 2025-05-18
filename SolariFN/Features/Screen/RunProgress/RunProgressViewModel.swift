//
//  RunProgressViewModel.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 13/05/25.
//

import Combine
import CoreLocation
import CoreMotion
import Foundation
import MapKit

class RunProgressViewModel: NSObject, ObservableObject,
    CLLocationManagerDelegate
{

    @Published var lastRegionEntered: String = ""
    private var cancellables = Set<AnyCancellable>()

    private let motionManager = CMMotionManager()
    private var userAcceleration: CMAcceleration = CMAcceleration()
    private var gravity: CMAcceleration = CMAcceleration()
    private var rotationRate: CMRotationRate = CMRotationRate()
    private var pedometerData: CMPedometerData?
    private var pedometer = CMPedometer()

    private var timer = Timer()
    private let timerInterval = 1.0
    @Published var timeElapsed: TimeInterval = 0.0
    @Published var seconds: Int = 0
    @Published var minutes: Int = 0
    @Published var hours: Int = 0

    private let stopColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    private let startColor = UIColor(
        red: 0.0, green: 0.75, blue: 0.0, alpha: 1.0)
    @Published var numberOfSteps: Int! = nil
    @Published var distance: String = "-"
    @Published var averagePace: Double! = nil
    @Published var pace: String = "-"

    @Published private(set) var steps: String = "-"
    @Published private(set) var elapsedTime: String = ""

    @Published private(set) var distance2: Double = 0

    @Published var accelerationValue: String = ""
    @Published private(set) var gravityValue: String = ""
    @Published private(set) var rotationValue: String = ""
    @Published var progress: Float = 0
    @Published var route: SolariRoute

    @Published private var shownRouteMarker: SMarker?
    @Published var isShowDetails: Bool = false

    @Published private(set) var isRunning: Bool = true
    
    private var manager = CLLocationManager()

    init(solariRoute: SolariRoute, locationService: LocationRepository) {
        self.route = solariRoute
        
        super.init()
        self.manager.delegate = self
        
//        locationService.regionEntryPublisher
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] regionId in
//                self?.lastRegionEntered = "Entered region: \(regionId)"
//                print("ENTERED REGION \(regionId)")
//            }
//            .store(in: &cancellables)

        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.accelerometerUpdateInterval = 1.0 / 60.0
        motionManager.gyroUpdateInterval = 1.0 / 20.0

        startUpdates()
        togglePedometerUpdates()
    }

    func toggleIsRunning() {
        isRunning.toggle()
    }

    func setShownRouteMarker(_ shownRouteMarker: SMarker?) {
        self.shownRouteMarker = shownRouteMarker
    }

    func getSelectedMarker() -> SMarker {
        if let shownRouteMarker = shownRouteMarker {
            return shownRouteMarker
        } else {
            isShowDetails = false
            return route.markers[0]
        }
    }

    func startUpdates() {
        accelerationValue = ""
        gravityValue = ""
        rotationValue = ""
        startUpdateMotions()
    }

    func stopUpdates() {
        motionManager.stopDeviceMotionUpdates()
        motionManager.stopAccelerometerUpdates()
        motionManager.stopGyroUpdates()
    }

    func togglePedometerUpdates() {
        if isRunning {
            startPedometerUpdates()
            startTimer()
        } else {
            stopPedometerUpdates()
            stopTimer()
        }
    }

    private func startUpdateMotions() {
        motionManager.startDeviceMotionUpdates(to: .main) {
            [weak self] (motion, error) in
            guard let self = self else { return }
            if let motion = motion {
                self.userAcceleration = motion.userAcceleration
                self.gravity = motion.gravity
                self.rotationRate = motion.rotationRate
            }

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            getMotionAndGravity(motion: motion)
        }

        motionManager.startGyroUpdates(to: .main) {
            [weak self] (gyroData, error) in
            guard let self = self else { return }
            getRotation(gyroData: gyroData)
        }

    }

    private func getMotionAndGravity(motion: CMDeviceMotion?) {
        if let motion = motion {
            self.userAcceleration = motion.userAcceleration
            self.gravity = motion.gravity
            self.accelerationValue =
                "X: \(userAcceleration.x), \n Y: \(userAcceleration.y), \n Z: \(userAcceleration.z)"
            self.gravityValue =
                "X: \(gravity.x), \n Y: \(gravity.y), \n Z: \(gravity.z)"
        }
    }

    private func getRotation(gyroData: CMGyroData?) {
        if let gyroData = gyroData {
            // Get rotation rate data
            self.rotationRate = gyroData.rotationRate
            // Update publisher with the new sensor data
            self.rotationValue =
                "X: \(rotationRate.x), \n Y: \(rotationRate.y), \n Z: \(rotationRate.z)"
        }
    }

    private func startPedometerUpdates() {
        pedometer = CMPedometer()
        pedometer.startUpdates(
            from: Date(),
            withHandler: { (pedometerData, error) in
                if let pedData = pedometerData {
                    DispatchQueue.main.async {
                        self.steps = "\(pedData.numberOfSteps)"
                    }

                    if let distance = pedData.distance {
                        DispatchQueue.main.async {
                            self.distance = "\(distance.intValue)"
                        }

                    }
                    //                    if let averageActivePace = pedData.averageActivePace {
                    //                        self.averagePace = Double(truncating: averageActivePace)
                    //                    }
                    if let currentPace = pedData.currentPace {
                        DispatchQueue.main.async {
                            //                            self.state = state
                            self.pace =
                                "\(currentPace.doubleValue.forTrailingZero())"
                        }

                    }
                } else {
                    self.steps = "-"
                }

            })

        //        timeElapsed += self.timerInterval

        self.elapsedTime = "On: " + timeIntervalFormat(interval: timeElapsed)
        //Number of steps
        if let numberOfSteps = self.numberOfSteps {
            self.elapsedTime = String(format: "Steps: %i", numberOfSteps)
        }
    }

    private func stopPedometerUpdates() {
        pedometer.stopUpdates()
    }

    func startTimer() {
        if timer.isValid { timer.invalidate() }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            time in

            var counter = Int(time.timeInterval)
            self.timeElapsed += time.timeInterval

            self.seconds = (self.seconds + counter) % 60
            self.minutes += (self.seconds / 60)
            self.hours += (self.minutes / 60)
        }
    }

    func stopTimer() {
        timer.invalidate()
    }

    private func timeIntervalFormat(interval: TimeInterval) -> String {
        var seconds = Int(interval + 0.5)  //round up seconds
        let hours = seconds / 3600
        let minutes = (seconds / 60) % 60
        seconds = seconds % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }

    private func paceString(title: String, pace: Double) -> String {
        var minPerMile = 0.0
        let factor = 26.8224  //conversion factor
        if pace != 0 {
            minPerMile = factor / pace
        }
        let minutes = Int(minPerMile)
        let seconds = Int(minPerMile * 60) % 60
        return String(
            format: "%@: %02.2f m/s \n\t\t %02i:%02i min/mi", title, pace,
            minutes, seconds)
    }

    func miles(meters: Double) -> Double {
        let mile = 0.000621371192
        return meters * mile
    }
    
    

    func locationManager(
        _ manager: CLLocationManager, didEnterRegion region: CLRegion
    ) {
        // TODO: Walawe mlebu region rek
        print("USER ENTERED REGION")
        if let circularRegion = region as? CLCircularRegion {
            DispatchQueue.main.async {
                print("Za kwa region:::\(circularRegion.identifier)")
            }
        }
    }

//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        print("Current status : \(manager.authorizationStatus)")
//    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("THE STATUS", manager.authorizationStatus)
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
//            manager.startUpdatingLocation()
            print("===Monitoring are available===")
        }
//        self.authorizationStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse
            || manager.authorizationStatus == .authorizedAlways
        {
            print("STARTING")
            for marker in route.markers {
                print("MARKER", marker)
                let region = CLCircularRegion(
                    center: marker.coordinate, radius: 5, identifier: marker.id.uuidString)
                region.notifyOnEntry = true
                region.notifyOnExit = false
                manager.startMonitoring(for: region)
                manager.requestState(for: region)
            }
            manager.startUpdatingLocation()
        } else {
//            manager.requestWhenInUseAuthorization()
            manager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("✅ Started monitoring \(region.identifier)")
    }

    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("❌ Monitoring failed: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        if state == .inside {
//            regionEntrySubject.send("Already inside region: \(region.identifier)")
            print("Already inside region: \(region.identifier)")
            for marker in route.markers {
                if marker.id.uuidString == region.identifier {
                    print("FOUND IT")
                    self.objectWillChange.send()
                    self.isShowDetails = true
                    self.shownRouteMarker = marker
                }
            }
        } else if state == .outside {
            print("Outside region: \(region.identifier)")
        }
    }

}
