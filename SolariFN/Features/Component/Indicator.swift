//
//  Indicator.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 14/05/25.
//

import SwiftUI

struct Indicator: View {
    var label: String
    var type: String
    var value: String
    
    init (label: String, type: String, value: String) {
        self.label = label
        self.value = value
        self.type = type
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(label) (\(type))")
                .foregroundStyle(Color.volcanicSand)
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .light))
                .padding(.bottom, -4)
            Rectangle()
                .frame(width: 100, height: 2)
                .foregroundColor(.hollyGlen)
                .cornerRadius(4)
            Text("\(value)")
                .foregroundStyle(Color.volcanicSand)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, -6)
        }
        
    }
    
}

#Preview {
    Indicator(label: "Distance", type: "km", value: "100")
}
