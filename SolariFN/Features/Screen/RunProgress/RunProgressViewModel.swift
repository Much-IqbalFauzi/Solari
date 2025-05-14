//
//  RunProgressViewModel.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 13/05/25.
//

import Foundation
import Combine
import CoreLocation


class RunProgressViewModel: ObservableObject {
    @Published var progress: Float = 0
    
    
    @Published var route: SolariRoute
    
    init(solariRoute: SolariRoute) {
        self.route = solariRoute
    }
    
}
