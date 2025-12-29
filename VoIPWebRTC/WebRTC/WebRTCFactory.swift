import WebRTC
final class WebRTCFactory { static let shared: RTCPeerConnectionFactory = { RTCInitializeSSL(); return RTCPeerConnectionFactory() }() }