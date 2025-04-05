//
//  PolylineMapView.swift
//  Solari
//
//  Created by Ailsa Anarghia on 05/04/25.
//

import SwiftUI
import MapKit

struct PolylineMapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    let walkingRoute: [CLLocationCoordinate2D]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = true
        mapView.isRotateEnabled = false
        mapView.isPitchEnabled = false
        mapView.setRegion(region, animated: false)
        
        let polyline = MKPolyline(coordinates: walkingRoute, count: walkingRoute.count)
        mapView.addOverlay(polyline)
        
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}


//#Preview {
//    PolylineMapView()
//}
