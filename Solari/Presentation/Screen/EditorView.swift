//
//  EditorView.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 15/05/25.
//

import SwiftUI
import PhotosUI

struct EditorView: View {
    var image: UIImage
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
    
    var body: some View {
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
                            distance: "500 m",
                            pace: "5:12 /km",
                            date: "May 15, 2025",
                            textColor: textColor, showBackground: showTextBackground, coordinates: runDataManager.locationHistory
                                .map { $0.coordinate }
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
                        ZStack {
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

                    // Color picker buttons
                    ForEach([Color.black, Color.white, Color(hex: "#9BE865")], id: \.self) { color in
                        Button(action: {
                            textColor = color
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

        let composedView = ZStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: screenSize.width, height: screenSize.height)
                .ignoresSafeArea()
            
            ShareText(
                distance: "500 m",
                pace: "5:12 /km",
                date: "May 15, 2025",
                textColor: textColor, showBackground: showTextBackground, coordinates: runDataManager.locationHistory
                    .map { $0.coordinate }
            )
            .scaleEffect(scale)
            .offset(textOffset)
        }

        let imageResult = composedView.snapshot(size: screenSize)

        UIImageWriteToSavedPhotosAlbum(imageResult, nil, nil, nil)
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

