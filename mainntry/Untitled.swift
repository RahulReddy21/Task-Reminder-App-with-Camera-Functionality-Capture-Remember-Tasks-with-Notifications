

import SwiftData
import Foundation

@Model
class Photo {
    @Attribute(.unique) var id: UUID
    var topic: String
    var imageData: Data?
    var date: Date
    var notes: String

    init(topic: String, imageData: Data?, date: Date = Date(), notes: String = "") {
        self.id = UUID()
        self.topic = topic
        self.imageData = imageData
        self.date = date
        self.notes = notes
    }
}
