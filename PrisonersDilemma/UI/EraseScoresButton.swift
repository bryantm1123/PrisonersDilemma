import SwiftUI

struct EraseScoresButton: View {
    @Binding var prisoner1: Prisoner
    @Binding var prisoner2: Prisoner
    var body: some View {
        Button {
            prisoner1.score = 0
            prisoner2.score = 0
        } label: {
            Image(systemName: "eraser")
                .frame(width: 24, height: 24)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var prisoner1 = Prisoner(score: 0, strategy: StrategyCatalog.Cooperator)
        @State var prisoner2 = Prisoner(score: 0, strategy: StrategyCatalog.Cooperator)
        
        var body: some View {
            EraseScoresButton(
                prisoner1: $prisoner1,
                prisoner2: $prisoner2)
        }
    }
    return Preview()
}
