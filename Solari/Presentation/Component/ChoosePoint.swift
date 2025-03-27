//
//  ChoosePoint.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 27/03/25.
//

import SwiftUI

struct ChoosePoint: View {
    private let startPoints: [(name: String, coordinate: (lat: Double, lon: Double))] = [
          ("Point A", (lat: -6.2088, lon: 106.8456)), // Example coordinates (Jakarta)
          ("Point B", (lat: -7.2504, lon: 112.7688))  // Example coordinates (Surabaya)
      ]
    
    @State private var selectedIndex = 0 // Track selected index
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(startPoints.indices, id: \ .self) { index in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 320, height: 90)
                        
                        Text(startPoints[index].name)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                    .frame(width: 320, height: 80)
                }
            }
            .tabViewStyle(.page)
            .frame(width: 320, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 2, x: 0, y: 2)
        }
    }
}

#Preview {
    ChoosePoint()
}
