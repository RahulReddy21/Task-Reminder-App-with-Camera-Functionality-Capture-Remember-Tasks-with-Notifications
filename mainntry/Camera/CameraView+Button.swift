//
//  CameraView+Button.swift
//  mainntry
//
//  Created by Irem Nur Arslaner on 09/11/24.
//

import SwiftUI
import UIKit
import Photos

extension CameraView {
    var usePhotoButton: some View {
      
        
      
            ControlButtonView(label: "Use Photo") {
            imageData = VM.photoData
            showCamera = false
            
        }
    
    }
     var retakeButton: some View {
        ControlButtonView(label: "Retake") {
            VM.retakePhoto()
        }
    }
    var cancelButton: some View {
        ControlButtonView(label: "Cancel") {
            showCamera = false
        }
    }
     var photoCapturebutton: some View {
        Button {
            VM.takePhoto()
        } label: {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 65)
                Circle()
                    .stroke(.white, lineWidth: 3)
                    .frame(width: 75)
            }
        }
    }
}



#Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}

