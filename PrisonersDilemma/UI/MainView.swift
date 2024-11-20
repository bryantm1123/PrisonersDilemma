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

struct PlayButton: View {
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
