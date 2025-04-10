//
//  SummaryViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 09/04/25.
//

import Foundation
import SwiftUI

class SummaryViewModel: ObservableObject {
    
    @Published var route: solariRoute
    
    init(routeId: UUID) {
        let route = routes.filter { $0.id == routeId }.first ?? routes.first!
        self.route = route
    }
}
