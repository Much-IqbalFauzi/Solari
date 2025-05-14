//
//  RunProgress.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//

import MapKit
import SwiftUI

struct RunProgress: View {

    @StateObject var vm: RunProgressViewModel

    init(solariRoute: SolariRoute) {
        _vm = StateObject(
            wrappedValue: RunProgressViewModel(solariRoute: solariRoute))
    }

    var body: some View {
        ZStack {
            Map(
                interactionModes: [.zoom, .pitch]
            ) {
                
                // TODO: route polyline
                MapPolyline(
                    coordinates: vm.route.markers.compactMap {
                        $0.coordinate
                    }
                )
                .stroke(Color.fuhciaFever, lineWidth: 8.0)
                
                
                // TODO: user annotation
                UserAnnotation()
                    .stroke(Color.red, lineWidth: 8.0)
                    .mapOverlayLevel(level: MKOverlayLevel.aboveRoads)
                    .tint(.red)
            }
        }
        .overlay(
            HStack() {
                Btn(text: "some info", trailingIcon: "", action: {})
                    .padding()
            }
            .frame(height: 150)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .foregroundStyle(.ultraThinMaterial.opacity(0.01))
//                    .shadow(radius: 4)
//                    .foregroundStyle(Color.white.opacity(0.8))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18))
                    .shadow(radius: 4)
            )
            ,
            alignment: .top
        )
        .overlay(
            HStack() {
                Btn(text: "Pause", trailingIcon: "", action: {})
                    .padding()
            }
            .frame(height: 150)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .foregroundStyle(.ultraThinMaterial.opacity(0.01))
//                    .shadow(radius: 4)
//                    .foregroundStyle(Color.white.opacity(0.01))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18))
                    .shadow(radius: 4)
            ),
            alignment: .bottom
        )
    }
}

#Preview {
    RunProgress(solariRoute: routes[0])
}
