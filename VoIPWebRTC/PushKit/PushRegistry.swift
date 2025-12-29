import PushKit

final class PushRegistry: NSObject, PKPushRegistryDelegate {
    static let shared = PushRegistry();
    let rtcVM = WebRTCViewModel();
    
    func initialize() {
        let r = PKPushRegistry(queue:.main);
        r.delegate=self;
        r.desiredPushTypes=[.voIP]
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion:@escaping()->Void) {
        let uuid = UUID();
        CallProvider.shared.reportIncoming(uuid: uuid, handle: "Incoming");
        rtcVM.prepareIncomingCall(uuid: uuid); completion()
    }
}
