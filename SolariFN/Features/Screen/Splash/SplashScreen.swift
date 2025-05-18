//
//  SplashScreen.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 07/05/25.
//

import SwiftUI

struct SplashScreen: View {
    @StateObject private var viewModel: SplashViewModel
    @EnvironmentObject private var navigation: Navigation

    init() {
        let deps = AppDependencies.shared
//        let locationManager = LocationManager()
//        let motionManager = MotionManager()
        //        let dataRepo = SwiftDataRepository()

        _viewModel = StateObject(
            wrappedValue: SplashViewModel(
                locationRepository: deps.locationManager,
                motionRepository: deps.motionManager
                    //            dataRepository: dataRepo
            ))
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Initializing...")
                .font(.title)
            Spacer()
//            ForEach(Array(viewModel.log.enumerated()), id: \.offset) { _, entry in
//                Text("• \(entry)")
//                    .font(.caption)
//            }
            Text(viewModel.logText)
                .font(.caption)
        }
        .padding()
        .onReceive(viewModel.$isReady) { ready in
            if ready {
                navigation.navigate(to: .selectRoute)
            }
        }
    }
}
