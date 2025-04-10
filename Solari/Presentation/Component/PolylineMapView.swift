//
//  PolylineMapView.swift
//  Solari
//
//  Created by Ailsa Anarghia on 05/04/25.
//

import SwiftUI
import MapKit

// this is for the default red circle annotate
class DotAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

// this is for the custom label annotation (A, B, C...)
class LabeledAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var label: String

    init(coordinate: CLLocationCoordinate2D, label: String) {
        self.coordinate = coordinate
        self.label = label
    }
}

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

        // Add red dots
        for coord in walkingRoute {
            mapView.addAnnotation(DotAnnotation(coordinate: coord))
        }

        // Tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleMapTap(_:)))
        tapGesture.delegate = context.coordinator
        mapView.addGestureRecognizer(tapGesture)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        var parent: PolylineMapView
        var mapView: MKMapView?
        var activeAnnotation: MKAnnotation?

        init(_ parent: PolylineMapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer()
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            self.mapView = mapView

            if annotation is MKUserLocation { return nil }

            if let dot = annotation as? DotAnnotation {
                let id = "Dot"
                var view = mapView.dequeueReusableAnnotationView(withIdentifier: id)
                if view == nil {
                    view = MKAnnotationView(annotation: dot, reuseIdentifier: id)
                    view?.frame = CGRect(x: 0, y: 0, width: 8, height: 8)
                    view?.backgroundColor = .red
                    view?.layer.cornerRadius = 4
                } else {
                    view?.annotation = dot
                }
                return view
            }

            if let labeled = annotation as? LabeledAnnotation {
                let id = "Labeled"
                var view = mapView.dequeueReusableAnnotationView(withIdentifier: id)

                if view == nil {
                    view = MKAnnotationView(annotation: labeled, reuseIdentifier: id)

                    let label = UILabel()
                    label.text = labeled.label
                    label.font = UIFont.boldSystemFont(ofSize: 18)
                    label.textColor = .white
                    label.backgroundColor = UIColor.systemBlue
                    label.textAlignment = .center
                    label.layer.cornerRadius = 12
                    label.clipsToBounds = true
                    label.frame = CGRect(x: -15, y: -30, width: 30, height: 24)

                    view?.addSubview(label)
                } else {
                    view?.annotation = labeled
                    if let label = view?.subviews.first as? UILabel {
                        label.text = labeled.label
                    }
                }

                view?.canShowCallout = false
                return view
            }

            return nil
        }

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let tapped = view.annotation as? DotAnnotation else { return }

            // this is to remove old label and restore dot
            if let active = activeAnnotation {
                mapView.removeAnnotation(active)
                mapView.addAnnotation(DotAnnotation(coordinate: active.coordinate))
                activeAnnotation = nil
            }

            // this is to replace tapped dot with label
            mapView.removeAnnotation(tapped)

            let index = parent.walkingRoute.firstIndex {
                $0.latitude == tapped.coordinate.latitude &&
                $0.longitude == tapped.coordinate.longitude
            } ?? 0

            let label = String(UnicodeScalar(65 + index)!) // A, B, C...
            let labelAnnotation = LabeledAnnotation(coordinate: tapped.coordinate, label: label)
            mapView.addAnnotation(labelAnnotation)

            activeAnnotation = labelAnnotation
        }

        @objc func handleMapTap(_ gesture: UITapGestureRecognizer) {
            guard let mapView = self.mapView else { return }

            let point = gesture.location(in: mapView)
            let coord = mapView.convert(point, toCoordinateFrom: mapView)

            // this is to deselect by removing label and show dot
            if let active = activeAnnotation {
                mapView.removeAnnotation(active)
                mapView.addAnnotation(DotAnnotation(coordinate: active.coordinate))
                activeAnnotation = nil
            }
        }

        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            true
        }
    }
}
