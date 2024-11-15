//
//  CameraView.swift
//  mainntry
//
//  Created by Irem Nur Arslaner on 09/11/24.
//

import SwiftUI

struct CameraView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    @State internal var VM = CameraViewModel()
    
    
    @Binding var imageData: Data?
    @Binding var showCamera: Bool
    
    let controlButtonWidth: CGFloat = 120
    let controlFrameHeight : CGFloat = 90
    
    var isLandscape: Bool { verticalSizeClass == .compact}
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack {
                    cameraPreview
                    if isLandscape {
                        verticalControlBar
                            .frame(width: controlFrameHeight)
                    }
                }
                if !isLandscape {
                    horizontalControlBar
                        .frame(height: controlFrameHeight)
                }
            }
        }
    }
    private var cameraPreview: some View {
        GeometryReader { geo in
            CameraPreview(cameraVM: $VM, frame: geo.frame(in: .global))
               .ignoresSafeArea()
                .onAppear() {
                    VM.requestAccessAndSetUp()
                }
        }
    }
}
    #Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}
