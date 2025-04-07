//
//  RunProgressViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 07/04/25.
//

import Foundation
import SwiftUI

class RunProgressViewModel: ObservableObject {
    
    @Published var progressRoute: solariRoute
    
    init(routeId: UUID) {
        progressRoute = routes.filter { $0.id == routeId }.first ?? routes.first!
    }
}
