//
//  Title.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 10/05/25.
//

import SwiftUI

struct Title: View {
    var text: String
    
    init (_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.volcanicSand)
    }
}


#Preview {
    Title("Title")
}
