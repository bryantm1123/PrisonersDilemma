import SwiftUI

struct MainView: View {
    @StateObject var game: Game = Game.Default
    
    var body: some View {
        VStack {
            HStack {
                PrisonerStack(prisoner: $game.prisoner1)
                Spacer()
                ScoreStack(
                    prisoner1: $game.prisoner1,
                    prisoner2: $game.prisoner2
                )
                Spacer()
                PrisonerStack(prisoner: $game.prisoner2)
            }
            PlayButton {
                game.play()
            }
        }
        .frame(width: 600, height: 200)
        .padding()
    }
}

#Preview {
}
