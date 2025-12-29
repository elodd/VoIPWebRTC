import CallKit
import AVFoundation

final class CallProvider: NSObject, CXProviderDelegate {
    static let shared = CallProvider();
    private let provider: CXProvider;
    
    private override init(){
        let cfg = CXProviderConfiguration(localizedName: "VoIPWebRTC")
        cfg.supportsVideo = false
        cfg.includesCallsInRecents = true
        provider = CXProvider(configuration: cfg)
        super.init();
        provider.setDelegate(self, queue:nil)
    }
    
    func reportIncoming(uuid:UUID, handle:String) {
        let update = CXCallUpdate();
        update.remoteHandle = CXHandle(type: .generic, value:handle);
        Task(name: "Report Incoming Call") {
            try? await provider
                .reportNewIncomingCall(with: uuid, update: update)
        }
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        AudioSessionManager.shared.activate();
        WebRTCClient.shared.startAudio();
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        WebRTCClient.shared.stopAudio();
        AudioSessionManager.shared.deactivate();
        action.fulfill()
    }

    func providerDidReset(_ provider: CXProvider) {
        WebRTCClient.shared.stopAudio();
        AudioSessionManager.shared.deactivate();
    }
}

