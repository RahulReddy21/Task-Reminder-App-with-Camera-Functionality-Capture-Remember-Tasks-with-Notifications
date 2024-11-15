//
//  View+.swift
//  mainntry
//
//  Created by Irem Nur Arslaner on 09/11/24.
//

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
