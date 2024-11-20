import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            HStack {
                PrisonerStack(name: "Prisoner 1")
                Spacer()
                ScoreStack()
                Spacer()
                PrisonerStack(name: "Prisoner 2")
            }
            PlayButton()
        }
        .frame(width: 400, height: 200)
        .padding()
    }
}

#Preview {
    MainView()
}
