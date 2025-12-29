import WebRTC

final class WebRTCClient {
    static let shared = WebRTCClient();
    private var pc:RTCPeerConnection?;
    
    func startAudio() {
        let cfg = ICEConfiguration.defaultConfig();
        pc = WebRTCFactory.shared.peerConnection(with: cfg, constraints: RTCMediaConstraints(mandatoryConstraints:nil, optionalConstraints:nil), delegate:nil);
        let src = WebRTCFactory.shared.audioSource(with: RTCMediaConstraints(mandatoryConstraints:["googEchoCancellation":"true","googNoiseSuppression":"true","googAutoGainControl":"true"], optionalConstraints:nil));
        let track = WebRTCFactory.shared.audioTrack(with: src, trackId:"audio0"); pc?.add(track, streamIds:["stream0"]) }
 
    func stopAudio() {
        pc?.close(); pc=nil
    }
}
