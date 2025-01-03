import SwiftUI

struct StrategyStack: View {
    @Binding var selectedStrategy: Strategy
    private let strategies = StrategyCatalog.strategies
    
    var body: some View {
        VStack {
            Image(selectedStrategy.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300)
                .cornerRadius(8)
                .rotationEffect(.degrees(90)) // TODO: fix this?
            Picker(
                selection: $selectedStrategy) {
                    ForEach(strategies) { prisoner in
                        Text(prisoner.name).tag(prisoner)
                    }
                } label: {
                    Text("")
                }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Text("\(selectedStrategy.description)")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

#Preview {
    struct Preview: View {
        @State var prisoner = Prisoner(score: 0, strategy: StrategyCatalog.Cooperator)
        var body: some View {
            StrategyStack(selectedStrategy: $prisoner.strategy)
        }
    }
    return Preview()
}
