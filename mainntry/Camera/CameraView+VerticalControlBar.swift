

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
