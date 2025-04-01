//
//  ContentView.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationManager = NavigationManager()
//    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            HomeScreen()
                .navigationDestination(for: RouteNav.self) { route in
                    switch route {
                    case .home:
                        HomeScreen()
                    case .startPoint:
                        RouteStartPointScreen()
                    case .startProgress:
                        RunProgressScreen()
                    case .summary:
                        SummaryScreen()
                    }
                }
        }
        .environmentObject(navigationManager)
    }
}

#Preview {
    ContentView()
}
