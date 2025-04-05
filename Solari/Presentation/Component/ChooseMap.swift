//
//  ChooseMap.swift
//  Solari
//
//  Created by Ailsa Anarghia on 03/04/25.
//

import SwiftUI
import MapKit

struct ChooseMap: View {
    private let startPoints: [(name: String, coordinate: [CLLocationCoordinate2D])] = [
              ("Short Run", [
                CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047),
                CLLocationCoordinate2D(latitude: -6.301446, longitude: 106.650716)
                
            ]),
              ("Long Run", [
                CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047),
                CLLocationCoordinate2D(latitude: -6.301446, longitude: 106.650716),
                CLLocationCoordinate2D(latitude: -6.300669, longitude: 106.652796),
                CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047)
                
            ])
          ]
        
        @State private var selectedIndex = 0 // Track selected index
        
        var body: some View {

            VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(startPoints.indices, id: \.self) { index in
                        VStack {
                            Text(startPoints[index].name)
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .frame(width: 380, height: 50)
                                    ZStack {
                                        MapComponent(walkingRoute: startPoints[index].coordinate)
                                        
                                    }
                                    .tag(index)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(width: 380, height: 480)
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.action
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
                }
                .clipShape(RoundedRectangle(cornerRadius: 15) ) // Clipping with roundedRectangle shape
                
            }
        }

}

#Preview {
    ChooseMap()
}
