//
//  SelectRoute.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 04/05/25.
//

import Combine
import MapKit
import SwiftUI

struct SelectRoute: View {

    private var listRoute: [SolariRoute] = routes
    
    @EnvironmentObject private var navigation: Navigation
    @StateObject var vm: SelectRouteViewModel

    init() {
        _vm = StateObject(wrappedValue: SelectRouteViewModel())
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical) {
                VStack {
                    ForEach(Array(listRoute.enumerated()), id: \.offset) {
                        index, route in
                        CardContainer {
                            Title(route.name)
                                .padding(.top, 15)
                                .foregroundStyle(Color.volcanicSand)
                            Map(
                                interactionModes: [.zoom]
                            ) {
                                // TODO: Polyline
                                MapPolyline(
                                    coordinates: route.markers.compactMap {
                                        $0.coordinate
                                    }
                                )
                                .stroke(Color.fuhciaFever.opacity(0.7), lineWidth: 6.0)
                                
                                // TODO: Marker
                                ForEach(
                                    Array(
                                        route.markers.enumerated()),
                                    id: \.offset
                                ) { idx, marker in
                                    if marker.showMarker {
                                        Marker(
                                            marker.name,
                                            systemImage:
                                                "figure.run.circle.fill",
                                            coordinate: marker
                                                .coordinate
                                        ).tint(Color.fuhciaFever)
                                    }
                                    
                                }
                            }
                            .frame(height: 300)

                            SubTitle("Description")
                                .padding(.top, 15)
                                .foregroundStyle(Color.volcanicSand)
                            Text(route.description)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.volcanicSand)
                                .multilineTextAlignment(.center)
                                .frame(height: 60)
                                .padding(.horizontal, 8)
                            Btn(
                                text: "Run",
                                action: {
                                    navigation.navigate(to: .runProgress(solariRoute: route))
                                })
                        }.scrollTransition { effect, phase in
                            effect
                                .opacity(phase.isIdentity ? 1 : 0.4)
                                .offset(x: vm.offset(for: phase, index))
                        }
                    }
                    Rectangle()
                        .fill(Color.whiteCrest)
                        .frame(height: 120)
                }.scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(16, for: .scrollContent)
            .background(Color.whiteCrest)

            VStack(spacing: 0) {
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .whiteCrest, location: 0),
                        .init(color: .clear, location: 0.4),
                    ]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: 100)
                Rectangle()
                    .fill(Color.whiteCrest)
                    .frame(height: 40)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    SelectRoute()
}
