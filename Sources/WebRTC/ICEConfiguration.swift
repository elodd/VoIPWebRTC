import WebRTC

struct ICEConfiguration {
    static func defaultConfig()->RTCConfiguration {
        let c = RTCConfiguration();
        c.sdpSemantics = .unifiedPlan;
        c.iceServers=[RTCIceServer(urlStrings:["stun:stun.l.google.com:19302"]), RTCIceServer(urlStrings:["turn:turn.example.com:3478"], username:"turnuser", credential:"turnpassword")];
        return c
    }
}
