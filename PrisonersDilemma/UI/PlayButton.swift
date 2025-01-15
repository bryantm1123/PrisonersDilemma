import SwiftUI

struct PlayButton: View {
    var playAction: () -> Void
    var body: some View {
        Button {
            playAction()
        } label: {
            Image(systemName: "play")
                .frame(width: 24, height: 24)
        }
        .frame(width: 24, height: 24)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 5))
    }
}

#Preview {
    PlayButton { print("play tapped") }
}
