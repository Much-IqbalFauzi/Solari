//
//  CameraCapture.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 13/05/25.
//

import SwiftUI
import UIKit

struct CameraCaptureView: View {
    var routeId: UUID

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var showImagePicker = true
    @State private var capturedImage: UIImage?

    var body: some View {
        VStack {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)

                Button("Done") {
                    navigationManager.capturedImage = image
                    dismiss()
                }
                .padding()
            }
        }
        .fullScreenCover(isPresented: $showImagePicker, onDismiss: {
            if capturedImage == nil {
                dismiss() // auto-dismiss if user cancels camera
            }
        }) {
            CameraPicker { image in
                self.capturedImage = image
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
