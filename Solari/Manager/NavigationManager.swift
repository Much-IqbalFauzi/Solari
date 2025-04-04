//
//  NavigationManager.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 01/04/25.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: RouteNav) {
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

enum RouteNav: Hashable {
    case home
    case startPoint
    case startProgress
    case summary
}
