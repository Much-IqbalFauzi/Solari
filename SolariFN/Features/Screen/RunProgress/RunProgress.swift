//
//  RunProgress.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//

import Combine
import CoreLocation
import CoreMotion
import MapKit
import SwiftUI

struct RunProgress: View {

    @StateObject var vm: RunProgressViewModel
    

    init(solariRoute: SolariRoute) {
        _vm = StateObject(
            wrappedValue: RunProgressViewModel(solariRoute: solariRoute, locationService: AppDependencies.shared.locationManager))
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
                .stroke(Color.fuhciaFever.opacity(0.7), lineWidth: 6.0)

                // TODO: user annotation
                UserAnnotation()
                    .stroke(Color.red, lineWidth: 8.0)
                    .mapOverlayLevel(level: MKOverlayLevel.aboveRoads)
                    .tint(.red)

                // TODO: Markers
                ForEach(vm.route.markers.indices, id: \.self) { idx in
                    let marker = vm.route.markers[idx]
                    if marker.showMarker {
                        Annotation(
                            marker.name,
                            coordinate: marker.coordinate,
                            content: {
                                AnnotationBtn(action: {
                                    vm.setShownRouteMarker(marker)
                                    $vm.isShowDetails.wrappedValue.toggle()
                                })
                            })
                    }
                }
            }
        }
        .sheet(isPresented: $vm.isShowDetails) {
            let marker = vm.getSelectedMarker()
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.fuhciaFever)
                .frame(width: 60, height: 4)
                .padding()
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 10) {
                    Title("Point: \(marker.name)")
                    
                    SubTitle("Desctiption :")
                        .fontWeight(.light)
                        .foregroundStyle(Color.volcanicSand)
                        .padding(.top, 14)
                    Text(marker.waypointDetail.description)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color.volcanicSand)

                    SubTitle("Activities Spot :")
                        .font(.system(size: 14, weight: .light))
                        .foregroundStyle(Color.volcanicSand)
                        .padding(.top, 14)
                    ForEach(
                        Array(marker.waypointDetail.activities.enumerated()),
                        id: \.offset
                    ) { idx, activity in
                        Text("\(idx + 1). \(activity)")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.volcanicSand)
                    }
                    
                    SubTitle("Behavior :")
                        .font(.system(size: 14, weight: .light))
                        .foregroundStyle(Color.volcanicSand)
                        .padding(.top, 14)
                    ForEach(
                        Array(marker.waypointDetail.obstacles.enumerated()),
                        id: \.offset
                    ) { idx, obstacle in
                        Text("\(idx + 1). \(obstacle)")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.volcanicSand)
                    }
                }
                .frame(width: vm.isShowDetails ? .infinity : 0)
            }
            .frame(width: vm.isShowDetails ? .infinity : 0)
            .presentationDetents([.fraction(0.6)])
            .ignoresSafeArea()
            Spacer()
        }
        .overlay(
            VStack(spacing: 30) {
                HStack(spacing: 30) {
                    VStack(spacing: 18) {
                        Indicator(label: "Distance", type: "m", value: "\(String(describing: vm.distance))")
                        Indicator(label: "Steps", type: "feet", value: vm.steps)
                    }
                    VStack{
                        RoundBtn(
                            icon: vm.isRunning ? "pause.fill" : "play.fill",
                            action: {
                                vm.toggleIsRunning()
                            })
                        Text("\(vm.hours):\(vm.minutes):\(vm.seconds)")
                            .foregroundStyle(Color.volcanicSand)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.top, 6)
                    }
                    VStack(spacing: 18) {
                        Indicator(label: "Pace", type: "Km/min", value: "\(vm.pace)")
                        Indicator(label: "Pace", type: "Avg", value: "5")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
//            .frame(height: 150)
            .padding(.horizontal, 8)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .foregroundStyle(.ultraThinMaterial.opacity(0.01))
                    .background(
                        .ultraThinMaterial.opacity(0.9),
                        in: RoundedRectangle(cornerRadius: 18)
                    )
                    .shadow(radius: 4)
            ).padding(.horizontal, 20),
            alignment: .top
        )
        .overlay(
            HStack {
                Btn(text: "Finish Run", trailingIcon: "", action: {})
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 120)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .foregroundStyle(.ultraThinMaterial.opacity(0.01))
                    .background(
                        .ultraThinMaterial.opacity(0.9),
                        in: RoundedRectangle(cornerRadius: 18)
                    )
                    .shadow(radius: 4)
            )
            .padding(.horizontal, 20),
            alignment: .bottom
        )
    }
}

#Preview {
    RunProgress(solariRoute: routes[0])
}
