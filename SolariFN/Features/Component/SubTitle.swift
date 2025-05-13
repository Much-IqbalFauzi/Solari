//
//  SubTitle.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 10/05/25.
//

import SwiftUI

struct SubTitle: View {
    var text: String
    
    init (_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
    }
}
