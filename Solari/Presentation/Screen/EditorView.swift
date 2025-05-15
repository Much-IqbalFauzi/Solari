//
//  EditorView.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 15/05/25.
//

import SwiftUI

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
    @State private var showTextBackground: Bool = true
    
    var body: some View {
        ZStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                HStack(alignment: .center, spacing: 12) {
                    
                    ZStack {
                        //Button to add rectangle background white transparent
                        Button(action: {
                            showTextBackground.toggle()
                        })
                        {
                            ZStack{
                                if showTextBackground {
                                    // Filled background
                                    Rectangle()
                                        .fill(Color.white.opacity(0.6))
                                        .frame(width: 23, height: 23)
                                        .cornerRadius(4)
                                } else {
                                    // Outline-only
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
                        
                    }
                    .padding(.horizontal)
                    
                    
                    
                    // Button to change text color
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
                                            textColor == color ? Color.white : Color.gray.opacity(0.4),
                                            lineWidth: textColor == color ? 3 : 1
                                        )
                                )
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal)
                
                
                Spacer()
            }
            
            ShareText(
                distance: "5.3 km",
                pace: "5:12 /km",
                date: "May 15, 2025",
                textColor: textColor,
                showBackground: showTextBackground
            )
            .scaleEffect(scale)
            .offset(textOffset)
            .gesture(
                dragGesture()
                    .simultaneously(with: pinchGesture())
            )
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
}


#Preview {
    EditorView(image: .imageDummy)
}
