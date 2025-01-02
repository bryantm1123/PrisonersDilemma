import SwiftUI

struct ScoreStack: View {
    @Binding var prisoner1: Prisoner
    @Binding var prisoner2: Prisoner
    var body: some View {
        VStack {
            Text("Score")
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .font(.title2)
            Text("\(prisoner1.score) : \(prisoner2.score)") //
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

#Preview {
    struct Preview: View { // TODO: Maybe DRY up this preview struct
        @State var prisoner1 = Prisoner(score: 0, behavior: BehaviorCatalog.Cooperator)
        @State var prisoner2 = Prisoner(score: 0, behavior: BehaviorCatalog.Defector)
        var body: some View {
            ScoreStack(
                prisoner1: $prisoner1,
                prisoner2: $prisoner2)
        }
    }
    return Preview()
}
