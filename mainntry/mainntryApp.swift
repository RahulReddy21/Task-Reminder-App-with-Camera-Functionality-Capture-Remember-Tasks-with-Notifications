
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
