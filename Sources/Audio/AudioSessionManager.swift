import AVFoundation

final class AudioSessionManager {
    static let shared = AudioSessionManager()

    func activate(){
        let s = AVAudioSession.sharedInstance()
        try? s.setCategory(.playAndRecord, mode:.voiceChat, options:[.allowBluetooth, .defaultToSpeaker])
        try? s.setActive(true)
    }

    func deactivate(){ try? AVAudioSession.sharedInstance().setActive(false)
    }
}
