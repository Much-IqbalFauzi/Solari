//
//  EditorView.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 15/05/25.
//

import SwiftUI
import PhotosUI
import SwiftData

struct EditorView: View {
    @Query(sort: \RunSession.date, order: .reverse)
    private var runSessions: [RunSession]
    let image: UIImage
    @State private var textColor: Color = .white
    let predefinedText = "Run Today"
    
    // Position state
    @State private var textOffset: CGSize = .zero
    @State private var lastDragValue: CGSize = .zero
    
    // Scale state
    @State private var scale: CGFloat = 1.0
    @State private var lastScaleValue: CGFloat = 1.0
    
    // Toggle
    @State private var showTextBackground: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var runDataManager: RunDataManager
    
    // Change icon image
    @State private var iconOptions: [UIImage] = []
    @State private var selectedIconIndex: Int = 0
    
    // Array of image names corresponding to each color
    let iconImageNames = ["Solari-Transparent-White", "Solari-Transparent-Black", "Solari-Transparent-GreenYellow"]

    // Mapping from Color to index in the iconImageNames array
    let colorToIconIndex: [Color: Int] = [
        .white: 0,
        .black: 1,
        Color(hex: "#D5FF5F"): 2
    ]
    
    //date
    let currentDate = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
    
    
    var body: some View {
        let latestSession = runSessions.first
        let distanceValue = latestSession?.distance ?? 500.0
        let durationValue = latestSession?.duration ?? 312.0

        let formattedDistance = runDataManager.formatDistanceInKM(distanceValue)
        let formattedPace = runDataManager.formatPaceString(distance: distanceValue, time: durationValue)

        
        ZStack {
            GeometryReader { geo in
                let width = geo.size.width
                let height = width * 16 / 9

                VStack {
                    ZStack {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: height)
                            .clipped()
                        
                        
                        ShareText(
                            distance: formattedDistance,
                            pace: formattedPace,
                            date: currentDate,
                            textColor: textColor, showBackground: showTextBackground, coordinates: runDataManager.locationHistory
                                .map { $0.coordinate },
                            iconName: iconImageNames[selectedIconIndex]
                        )
                        .scaleEffect(scale)
                        .offset(textOffset)
                        .gesture(
                            dragGesture()
                                .simultaneously(with: pinchGesture())
                        )
                    }
                    .frame(width: width, height: height)
                    .cornerRadius(20)
                    
                    Spacer()
                }
            }
            
            // Top-left Close Button
            VStack() {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.leading, 20)
                Spacer()
            }

            // Centered control buttons
            VStack {
                HStack(alignment: .center, spacing: 12) {
                    // A Button
                    Button(action: {
                        showTextBackground.toggle()
                    }) {
                        ZStack(alignment: .center) {
                            if showTextBackground {
                                Rectangle()
                                    .fill(Color.white.opacity(0.6))
                                    .frame(width: 23, height: 23)
                                    .cornerRadius(4)
                            } else {
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .frame(width: 23, height: 23)
                                    .cornerRadius(4)
                            }

                            Text("A")
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    // Color picker buttons and iconImage color
                    ForEach([Color.white, Color.black, Color(hex: "#D5FF5F")], id: \.self) { color in
                        Button(action: {
                            textColor = color
                            if let index = colorToIconIndex[color] {
                                selectedIconIndex = index
                            }
                        }) {
                            Circle()
                                .fill(color)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Circle()
                                        .stroke(
                                            textColor == color ? Color.white : Color.gray.opacity(0.8),
                                            lineWidth: textColor == color ? 3 : 1
                                        )
                                )
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            
            GeometryReader{ geo in
                VStack {
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                            saveComposedImage()
                        }) {
                            Label("Save", systemImage: "square.and.arrow.down")
                                .padding(12)
                                .background(Color.black.opacity(0.6))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .padding(.trailing, max(0, 0 - geo.safeAreaInsets.trailing))
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding()
            }
        }
        .background(.black)
    }
    
    // Extracted Drag Gesture
    private func dragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                textOffset = CGSize(
                    width: lastDragValue.width + value.translation.width,
                    height: lastDragValue.height + value.translation.height
                )
            }
            .onEnded { _ in
                lastDragValue = textOffset
            }
    }
    
    // Extracted Pinch Gesture
    private func pinchGesture() -> some Gesture {
        MagnificationGesture()
            .onChanged { value in
                scale = lastScaleValue * value
            }
            .onEnded { _ in
                lastScaleValue = scale
            }
    }
    
    private func saveComposedImage() {
        let screenWidth = UIScreen.main.bounds.width
        let screenSize = CGSize(width: screenWidth, height: screenWidth * 16 / 9)
        
        let latestSession = runSessions.first
        let distanceValue = latestSession?.distance ?? 500.0
        let durationValue = latestSession?.duration ?? 312.0

        let formattedDistance = runDataManager.formatDistanceInKM(distanceValue)
        let formattedPace = runDataManager.formatPaceString(distance: distanceValue, time: durationValue)

        let composedView = ZStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: screenSize.width, height: screenSize.height)
                .ignoresSafeArea()
            
            ShareText(
                distance: formattedDistance,
                pace: formattedPace,
                date: currentDate,
                textColor: textColor, showBackground: showTextBackground, coordinates: runDataManager.locationHistory
                    .map { $0.coordinate },
                iconName: iconImageNames[selectedIconIndex]
            )
            .scaleEffect(scale)
            .offset(textOffset)
        }

        let imageResult = composedView.snapshot(size: screenSize)

        UIImageWriteToSavedPhotosAlbum(imageResult, nil, nil, nil)
    }
    
    private func iconForColor(_ color: Color) -> UIImage {
        guard !iconOptions.isEmpty else { return UIImage() }
        
        switch color {
        case Color.black:
            return iconOptions.indices.contains(1) ? iconOptions[1] : iconOptions[0]
        case Color.white:
            return iconOptions[0]
        case Color(hex: "#9BE865"):
            return iconOptions.indices.contains(2) ? iconOptions[2] : iconOptions[0]
        default:
            return iconOptions[0]
        }
    }
}

extension View {
    func snapshot(size: CGSize, scale: CGFloat = UIScreen.main.scale) -> UIImage {
        let controller = UIHostingController(rootView: self)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: size, format: UIGraphicsImageRendererFormat.default())
        return renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

#Preview {
    EditorView(
        image: UIImage(named: "image-dummy")!,
        runDataManager: RunDataManager(locationManager: MyLocationManager())
    )
}

