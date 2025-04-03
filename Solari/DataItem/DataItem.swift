//
//  DataItem.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 04/04/25.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    var id: UUID
    var action: Int
    var total: Int
    var estimatedTime: Int
    
    init(id: UUID = .init(), action: Int, total: Int, estimatedTime: String) {
        self.id = id
        self.action = action
        self.total = total
        self.estimatedTime = Int(estimatedTime) ?? 0
    }
}
