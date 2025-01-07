import SwiftUI

struct MainView: View {
    @StateObject var game: Game = Game.Default
    @State var iterations: Double = 0.0
    
    var body: some View {
        VStack {
            HStack {
                StrategyStack(selectedStrategy: $game.prisoner1.strategy)
                Spacer()
                ScoreStack(
                    prisoner1: $game.prisoner1,
                    prisoner2: $game.prisoner2
                )
                Spacer()
                StrategyStack(selectedStrategy: $game.prisoner2.strategy)
            }
            PlayButton {
                game.play(iterations: Int(iterations))
            }
            SliderView(iterations: $iterations)
            EraseScoresButton(
                prisoner1: $game.prisoner1,
                prisoner2: $game.prisoner2
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    MainView(game: Game.Default)
}
