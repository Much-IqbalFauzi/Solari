//
//  SelectRouteViewModel.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//

import SwiftUI
import Combine
import Foundation

class SelectRouteViewModel: ObservableObject {
    @Published var selectedRoute: Route?
    
    @Published var routes: [Route] = []
    
    func offset(for phase: ScrollTransitionPhase, _ index: Int) -> Double {
        let isOdd = index % 2 == 0
        switch phase {
        case .identity:
            return 0
        case .topLeading:
            return isOdd ? 100 : -100
        case .bottomTrailing:
//            return isOdd ? -100 : 100
            return 0
        }
    }
}
