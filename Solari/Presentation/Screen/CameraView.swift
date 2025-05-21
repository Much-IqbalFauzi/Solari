import SwiftUI
import AVFoundation

struct CameraView: View {
    @Binding var capturedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            CameraPreviewView()
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding(.top, 10)
                
                Spacer()
                
                CameraButtonView(onCapture: { image in
                    if let image = image {
                        let croppedImage = cropTo9by16(image: image)
                        capturedImage = croppedImage
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                .padding(.bottom, 40)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
    }
    
    private func cropTo9by16(image: UIImage) -> UIImage {
        let originalSize = image.size
        let originalWidth = originalSize.width
        let originalHeight = originalSize.height
        
        let targetAspect: CGFloat = 9.0 / 16.0
        let targetWidth = originalHeight * targetAspect
        
        var cropRect: CGRect
        
        if originalWidth >= targetWidth {
            // Crop horizontally
            let xOffset = (originalWidth - targetWidth) / 2
            cropRect = CGRect(x: xOffset, y: 0, width: targetWidth, height: originalHeight)
        } else {
            // In rare case image is narrower than 9:16, crop vertically
            let targetHeight = originalWidth / targetAspect
            let yOffset = (originalHeight - targetHeight) / 2
            cropRect = CGRect(x: 0, y: yOffset, width: originalWidth, height: targetHeight)
        }
        
        guard let cgImage = image.cgImage?.cropping(to: cropRect) else {
            return image
        }
        
        return UIImage(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
    }
}

struct CameraButtonView: View {
    var onCapture: (UIImage?) -> Void
    
    var body: some View {
        Button(action: {
            CameraManager.shared.capturePhoto { image in
                onCapture(image)
            }
        }) {
            ZStack {
                Circle()
                    .strokeBorder(Color.white, lineWidth: 6)
                    .frame(width: 70, height: 70)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 60, height: 60)
            }
            .frame(width: 80, height: 80)
        }
    }
}

struct CameraPreviewView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        CameraManager.shared.setupCamera(with: view, previewAspectRatio: CGSize(width: 9, height: 16))
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed
    }
}

class CameraManager: NSObject, AVCapturePhotoCaptureDelegate {
    static let shared = CameraManager()
    
    private let captureSession = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private var photoOutput = AVCapturePhotoOutput()
    private var captureCompletion: ((UIImage?) -> Void)?
    
    private override init() {
        super.init()
    }
    
    func setupCamera(with view: UIView, previewAspectRatio: CGSize) {
        // Set up capture session
        captureSession.beginConfiguration()
        captureSession.sessionPreset = .photo
        
        // Add input
        guard let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: backCamera) else {
            print("Unable to access camera")
            return
        }
        
        if captureSession.canAddInput(input) {
            captureSession.addInput(input)
        }
        
        // Add output
        if captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
        }
        
        captureSession.commitConfiguration()
        
        // Create preview container with 9:16 aspect ratio
        let previewContainer = UIView(frame: view.bounds)
        previewContainer.backgroundColor = .black
        view.addSubview(previewContainer)
        
        previewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            previewContainer.heightAnchor.constraint(equalTo: previewContainer.widthAnchor, multiplier: previewAspectRatio.height / previewAspectRatio.width)
        ])
        
        // Set up preview layer
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = .resizeAspectFill
        previewLayer?.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width * (previewAspectRatio.height / previewAspectRatio.width))
        previewContainer.layer.addSublayer(previewLayer!)
        
        // Start capture session
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession.startRunning()
        }
    }
    
    func capturePhoto(completion: @escaping (UIImage?) -> Void) {
        captureCompletion = completion
        
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation(),
              let image = UIImage(data: imageData) else {
            captureCompletion?(nil)
            return
        }
        
        captureCompletion?(image)
    }
}
