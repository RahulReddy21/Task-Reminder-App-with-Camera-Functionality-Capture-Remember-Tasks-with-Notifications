
import Foundation
import AVFoundation
import UIKit
import SwiftUI

@Observable
class CameraViewModel: NSObject {
    
    enum PhotoCaptureState {
        case noStarted
        case processing
        case finished(Data)
    }
    
    var session = AVCaptureSession()
    var preview = AVCaptureVideoPreviewLayer()
    var output = AVCapturePhotoOutput()
    
    var photoData: Data? {
        if case .finished(let data) = photoCaptureState {
            return  data
        }
        return nil
    }
    var hasPhoto: Bool { photoData != nil }
    
    private(set) var photoCaptureState: PhotoCaptureState = .noStarted
    
    
    
    func requestAccessAndSetUp() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case.notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { didAllowAccess in
                self.setup()
            }
        case.authorized:
            setup()
        default:
            print("other satus")
        }
        
    }
    private func setup() {
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        do {
            guard let device = AVCaptureDevice.default(for: .video) else { return }
            let input = try AVCaptureDeviceInput(device: device)
            
            guard session.canAddInput(input) else { return }
            session.addInput(input)
            
            guard session.canAddOutput(output) else { return }
            session.addOutput(output)
            
            session.commitConfiguration()
            
            Task(priority: .background) {
                self.session.startRunning()
                await MainActor.run {
                    self.preview.connection?.videoRotationAngle = UIDevice.current.orientation.videoRotationAngle
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    func takePhoto() {
        guard case .noStarted = photoCaptureState else { return }

        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)

        withAnimation {
            self.photoCaptureState = .processing
            }

    }
    func retakePhoto() {
        Task(priority: .background) {
            self.session.startRunning()
            await MainActor.run {
                self.photoCaptureState = .noStarted
            }
        }
    }
}
extension CameraViewModel: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error {
            print(error.localizedDescription)
        }
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        guard let provider = CGDataProvider(data: imageData as CFData) else  { return }
        guard let   cgImage = CGImage(jpegDataProviderSource: provider, decode: nil, shouldInterpolate: true, intent: .defaultIntent) else { return }
        
            
            
        Task(priority: .background) {
            self.session.stopRunning()
            await MainActor.run {
                
                let image = UIImage(cgImage: cgImage, scale: 1, orientation: UIDevice.current.orientation.uiImageOrientation)
                let imageData = image.pngData()
                
                
                withAnimation {
                    if let imageData {
                        self.photoCaptureState = .finished(imageData)
                    } else {
                        print("error occured")
                    }
                }
            }
        }
    }
}
