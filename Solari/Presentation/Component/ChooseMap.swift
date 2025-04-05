//
//  ChooseMap.swift
//  Solari
//
//  Created by Ailsa Anarghia on 03/04/25.
//

import SwiftUI
import MapKit

struct ChooseMap: View {
    private let startPoints: [(name: String, coordinate: [CLLocationCoordinate2D], titleText: String, infoText: String, images:[String])] = [
              ("Short Run", [
                CLLocationCoordinate2D(latitude: -6.3014629, longitude: 106.6528766),
                CLLocationCoordinate2D(latitude: -6.302125, longitude: 106.652786),
                CLLocationCoordinate2D(latitude: -6.301790, longitude: 106.652320),
                CLLocationCoordinate2D(latitude: -6.301397, longitude: 106.652545),
                CLLocationCoordinate2D(latitude: -6.3014629, longitude: 106.6528766)
                
            ], "Short Run: 2 Points", "A strength, vertical and mix of trail and grit. Hey strength runners, this one’s for you!\n - ±1 km Run (5x laps)\n - 5x Upstairs\n - 5x Downstairs\n - ±45 m Elevation gain in total\n - Concrete blocks path, Pedestrian\n - Adjacent to the roads at the bottom", ["SHORT1", "SHORT2", "SHORT3", "SHORT4", "SHORT5", "SHORT6"]),
              ("Long Run", [
                CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047),
                CLLocationCoordinate2D(latitude: -6.301446, longitude: 106.650716),
                CLLocationCoordinate2D(latitude: -6.300669, longitude: 106.652796),
                CLLocationCoordinate2D(latitude: -6.302802, longitude: 106.652047)
                
            ], "Long Run: Looping the 3 Points", "Suits for maintain your pace with your own limits!\n - ±5 km (6x laps)\n - ± 60 m Elevation gain in total\n - 3 Points\n - No stairs\n - Concrete blocks path, Pedestrian\n - Adjacent to the roads", ["LONG1", "LONG2", "LONG3", "LONG4", "LONG5", "LONG6"] )
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
                                        MapComponent(walkingRoute: startPoints[index].coordinate, titleText: startPoints[index].titleText, infoText: startPoints[index].infoText, showInfo: true, images:startPoints[index].images)
                                        
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
