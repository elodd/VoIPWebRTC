import Foundation

@MainActor final class CallViewModel: ObservableObject {
    
    @Published var activeCallUUID: UUID?;
    
    func startCall() {
        activeCallUUID = CallController.shared.startCall(handle: "Test")
    }
    
    func endCall() {
        guard let id = activeCallUUID else {return};
        CallController.shared.endCall(uuid: id); activeCallUUID=nil
    }
}
