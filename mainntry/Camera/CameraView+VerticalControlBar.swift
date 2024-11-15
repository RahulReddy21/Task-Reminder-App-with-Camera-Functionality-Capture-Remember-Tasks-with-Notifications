//
//  CameraView+VerticalControlBar.swift
//  mainntry
//
//  Created by Irem Nur Arslaner on 09/11/24.
//

import SwiftUI

extension CameraView {
    @ViewBuilder  var verticalControlBar: some View {
         if VM.hasPhoto {
             verticalControlBarPostPhoto
         } else {
             verticalControlBarPrePhoto
         }
        
        
    }
    var verticalControlBarPrePhoto: some View {
        VStack {
            Spacer()
                .frame(height: controlButtonWidth)
            Spacer()
            photoCapturebutton
            Spacer()
            cancelButton
                .frame(height: controlButtonWidth)
        }
    }
    var verticalControlBarPostPhoto: some View {
        VStack {
            usePhotoButton
                .frame(height: controlButtonWidth)
            Spacer()
            retakeButton
                .frame(height: controlButtonWidth)
        }
    }

}
#Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}
