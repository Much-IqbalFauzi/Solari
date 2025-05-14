//
//  ContentView.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 04/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigation = Navigation()
    var body: some View {
        NavigationStack(path: $navigation.path) {
            SplashScreen()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .selectRoute:
                        SelectRoute()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("Select Route")
                    case .runProgress(let solariRoute):
                        RunProgress(solariRoute: solariRoute)
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            .interactiveDismissDisabled(true)
                    case .summary:
                        Text("Summary")
                    }
                }
        }
        .environmentObject(navigation)
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
