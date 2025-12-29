import CallKit

final class CallController {
    static let shared = CallController();
    private let controller = CXCallController();
    
    func startCall(handle:String)->UUID {
        let id=UUID();
        controller.request(CXTransaction(action: CXStartCallAction(call: id, handle: CXHandle(type: .generic, value: handle))));
        return id
    }
    
    func endCall(uuid:UUID) {
        controller.request(CXTransaction(action: CXEndCallAction(call: uuid)))
    }
}
