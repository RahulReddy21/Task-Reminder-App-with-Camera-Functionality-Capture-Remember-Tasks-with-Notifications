import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showCamera = false
    @State private var selectedTopic: String? = nil
    @Query private var photos: [Photo]
    @State var openAlert = false
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(destination: CardBoardView(
                    imageData: Binding(
                        get: { getImageData(for: "stove") },
                        set: { saveImageData($0, for: "stove") }
                    ),
                    textItem: "stove",
                    iconName: "flame",
                    date: getPhotoDate(for: "stove"),
                    notes: Binding(
                        get: { photos.first(where: { $0.topic == "stove" })?.notes ?? "" },
                        set: { photos.first(where: { $0.topic == "stove" })?.notes = $0 }
                    )
                )) {
                    photoCaptureView(topicKey: "stove", title: "Check the stove", iconName: "flame")
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: CardBoardView(imageData: Binding(
                    get: { getImageData(for: "window") },
                    set: { saveImageData($0, for: "window") }
                ), textItem: "window", iconName: "window.casement", date: getPhotoDate(for: "window"),
                                                          notes: Binding(
                                                              get: { photos.first(where: { $0.topic == "windowd" })?.notes ?? "" },
                                                              set: { photos.first(where: { $0.topic == "window" })?.notes = $0 }
                                                          )
                                                      )) {
                    photoCaptureView(topicKey: "window", title: "Check the window", iconName: "window.casement")
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: CardBoardView(imageData: Binding(
                    get: { getImageData(for: "door") },
                    set: { saveImageData($0, for: "door") }
                ), textItem: "door", iconName: "door.right.hand.closed", date: getPhotoDate(for: "door"),
                                                          notes: Binding(
                                                              get: { photos.first(where: { $0.topic == "door" })?.notes ?? "" },
                                                              set: { photos.first(where: { $0.topic == "door" })?.notes = $0 }
                                                          )
                                                      )) {
                    photoCaptureView(topicKey: "door", title: "Check the door", iconName: "door.right.hand.closed")
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: CardBoardView(imageData: Binding(
                    get: { getImageData(for: "plug") },
                    set: { saveImageData($0, for: "plug") }
                ), textItem: "plug", iconName: "powerplug", date: getPhotoDate(for: "plug"),
                                                          notes: Binding(
                                                              get: { photos.first(where: { $0.topic == "plug" })?.notes ?? "" },
                                                              set: { photos.first(where: { $0.topic == "plug" })?.notes = $0 }
                                                          )
                                                      )) {
                    photoCaptureView(topicKey: "plug", title: "Check the plug", iconName: "powerplug")
                }
                .buttonStyle(PlainButtonStyle())
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 150, height: 50)
                        .foregroundStyle(Color.label)
                  
                   
                        Text("Save")
                            .bold()
                            .foregroundStyle(Color.blue)
                        
                    
                    
                }
              
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        openAlert = true
                    }) {
                        Image(systemName: "gobackward.minus")
                         
                            
                            .foregroundStyle(.red)
                    }
                }
            }
            .alert("Delete all saved proofs?", isPresented: $openAlert) {
               
                Button("Yes") {
                    deleteAllPhotos()
                }
                Button("Cancel", role: .cancel) {
                    
                }
            }
        }
       
        .fullScreenCamera(isPresented: $showCamera, imageData: Binding(
            get: { selectedTopic.flatMap { getImageData(for: $0) } },
            set: { newImageData in
                if let topic = selectedTopic, let data = newImageData {
                    saveImageData(data, for: topic)
                }
            }
        ))
    }
    
    
    private func photoCaptureView(topicKey: String, title: String, iconName: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.label)
                .frame(width: 380, height: 80)
            
            HStack {
                HStack {
                    Text(title)
                        .bold()
                    Image(systemName: iconName)
                        .foregroundStyle(Color.red)
                }
                Spacer()
                
                if let imageData = getImageData(for: topicKey), let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                } else {
                    Button("Take Photo") {
                        selectedTopic = topicKey
                        showCamera = true
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
    
   
    private func getImageData(for topic: String) -> Data? {
        photos.first { $0.topic == topic }?.imageData
    }
    
    private func saveImageData(_ imageData: Data?, for topic: String) {
        if let photo = photos.first(where: { $0.topic == topic }) {
            photo.imageData = imageData
            photo.date = Date()
        } else {
           
            let newPhoto = Photo(topic: topic, imageData: imageData, date: Date())
            modelContext.insert(newPhoto)
        }
        try? modelContext.save()  // Save the context
    }
    
    // Delete all photos
    private func deleteAllPhotos() {
        photos.forEach { modelContext.delete($0) }
        try? modelContext.save()
    }
    
    private func getPhotoDate(for topic: String) -> Date? {
        photos.first { $0.topic == topic }?.date
    }
}

