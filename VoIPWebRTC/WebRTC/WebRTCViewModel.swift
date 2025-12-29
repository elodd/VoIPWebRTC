import Foundation
import Combine
import WebRTC

@MainActor final class WebRTCViewModel: ObservableObject {
    enum CallState:String{case idle,connecting,connected,ended,error};
    @Published private(set) var callState:CallState = .idle;
    private let client = WebRTCClient.shared;
    
    func prepareIncomingCall(uuid:UUID) {
        callState = .connecting
    }
}

