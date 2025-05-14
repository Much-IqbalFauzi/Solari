//
//  NavigationManager.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//

import SwiftUI

class Navigation: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
    }
}

enum Route: Hashable {
    case selectRoute
    case runProgress(solariRoute: SolariRoute)
    case summary
}
