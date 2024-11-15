//
//  Untitled.swift
//  mainntry
//
//  Created by Irem Nur Arslaner on 12/11/24.
//

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
