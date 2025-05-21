//
//  NavigationManager.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 01/04/25.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    @Published var capturedImage: UIImage? = nil
    var finishedRunDataManager: RunDataManager? = nil
    
    func navigate(to route: RouteNav, with runDataManager: RunDataManager? = nil) {
        if case .summary = route {
            self.finishedRunDataManager = runDataManager
        }
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
        finishedRunDataManager = nil
    }
}

enum RouteNav: Hashable {
    case home
    case startPoint
    case startProgress(routeId: UUID, startPointId: UUID)
    case summary(routeId: UUID)
}
