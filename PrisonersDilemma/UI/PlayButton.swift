import SwiftUI

struct PlayButton: View {
    // TODO: Could receive a play action callback and call it on button tap
    var body: some View {
        Button {
            print("play tapped")  // TODO: implement
        } label: {
            Image(systemName: "play")
                .frame(width: 24, height: 24)
        }
        .frame(width: 24, height: 24)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

#Preview {
    PlayButton()
}
