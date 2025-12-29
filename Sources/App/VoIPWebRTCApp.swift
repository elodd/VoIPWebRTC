import SwiftUI

@main struct VoIPWebRTCApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)

    var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
