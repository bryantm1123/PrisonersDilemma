import SwiftUI

struct MainView: View {
    @StateObject var game: Game = Game.Default
    @State var iterations: Double = 1.0
    
    var body: some View {
        VStack {
            HStack {
                BehaviorStack(selectedBehavior: $game.prisoner1.behavior)
                Spacer()
                ScoreStack(
                    prisoner1: $game.prisoner1,
                    prisoner2: $game.prisoner2
                )
                Spacer()
                BehaviorStack(selectedBehavior: $game.prisoner2.behavior)
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
