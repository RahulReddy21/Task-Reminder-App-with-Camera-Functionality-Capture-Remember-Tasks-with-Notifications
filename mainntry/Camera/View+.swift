

import SwiftUI

extension View {
    func fullScreenCamera(isPresented: Binding<Bool>, imageData: Binding<Data?>) -> some
    View {
        self
            .fullScreenCover(isPresented: isPresented, content: {
                CameraView(imageData: imageData, showCamera: isPresented)
                
            })
    }
    

}
