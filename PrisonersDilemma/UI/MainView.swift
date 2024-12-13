import SwiftUI

struct MainView: View {
    @StateObject var game: Game = Game.Default
    
    var body: some View {
        VStack {
            HStack {
                PrisonerStack(prisoner: $game.prisoner1)
                Spacer()
                ScoreStack()
                Spacer()
                PrisonerStack(prisoner: $game.prisoner2)
            }
            PlayButton()
        }
        .frame(width: 600, height: 200)
        .padding()
    }
}

#Preview {
    MainView(game: Game.Default)
}
