import SwiftUI

struct PrisonerStack: View {
    var name: String
    var body: some View {
        VStack {
            Text(name)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .font(.title2)
            Button {
                print("button tapped") // TODO: implement
            } label: {
                Text("Play Style")
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            Text("Points")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
            Text("30")
        }
    }
}

#Preview {
    PrisonerStack(name: "Prisoner 1")
}
