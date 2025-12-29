import SwiftUI

struct ContentView: View {
    @StateObject var vm = CallViewModel();
    
    var body: some View {
        VStack {
            if vm.activeCallUUID == nil {
                Button("Start Call") {
                    vm.startCall()
                }
            } else {
                Button("End Call") {
                    vm.endCall()
                }
            }
        }
    }
}
