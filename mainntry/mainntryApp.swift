//
//  mainntryApp.swift
//  mainntry
//
//  Created by Irem Nur Arslaner on 09/11/24.
//

import SwiftUI
import SwiftData

@main
struct mainntryApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup(makeContent: {
            FirstPage()
        })
    }
}
