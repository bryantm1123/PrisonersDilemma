import SwiftUI

struct ScoreStack: View {
    var body: some View {
        VStack {
            Text("Score")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                .font(.title2)
            Text("0 : 0") // TODO: Set with score of round
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

#Preview {
    ScoreStack()
}
