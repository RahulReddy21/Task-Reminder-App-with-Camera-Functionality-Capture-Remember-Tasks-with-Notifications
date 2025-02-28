

import SwiftUI

extension CameraView {
    
    @ViewBuilder  var  horizontalControlBar: some View {
         if VM.hasPhoto {
             horizontalControlBarPostPhoto
         } else {
             horizontalControlBarPrePhoto
         }
    
}
 var horizontalControlBarPrePhoto: some View {
    HStack {
        cancelButton
            .frame(width: controlButtonWidth)
        Spacer()
        photoCapturebutton
        Spacer()
        Spacer()
            .frame(width: controlButtonWidth)
    }
}

var horizontalControlBarPostPhoto: some View {
    HStack {
        retakeButton
            .frame(width: controlButtonWidth)
        Spacer()
        usePhotoButton
            .frame(width: controlButtonWidth)
    }
}
}

#Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}
