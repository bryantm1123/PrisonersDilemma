import SwiftUI

struct MainView: View {
    @StateObject var game: Game = Game.Default
    @State var iterations: Double = 0.0
    @State var isShowingInfoView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isShowingInfoView = true
                    } label: {
                        Image(systemName: "info.circle")
                            .frame(width: 24, height: 24)
                    }.buttonStyle(.borderless)
                        .frame(width: 24, height: 24)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
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
                SliderView(iterations: $iterations)
                HStack {
                    PlayButton {
                        game.play(iterations: Int(iterations))
                    }
                    EraseScoresButton(
                        prisoner1: $game.prisoner1,
                        prisoner2: $game.prisoner2,
                        defectSwitch: $game.defectSwitch
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
            
            if isShowingInfoView {
                InfoView(isShowingInfoView: $isShowingInfoView)
                    .background()
            }
        }
    }
}

#Preview {
    MainView(game: Game.Default)
}
