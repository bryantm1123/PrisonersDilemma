import SwiftUI

struct EraseScoresButton: View {
    @Binding var prisoner1: Prisoner
    @Binding var prisoner2: Prisoner
    @Binding var defectSwitch: DefectSwitch
    
    var body: some View {
        Button {
            prisoner1.score = 0
            prisoner2.score = 0
            defectSwitch = DefectSwitch()
        } label: {
            Image(systemName: "eraser")
                .frame(width: 24, height: 24)
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 0))
    }
}

#Preview {
    struct Preview: View {
        @State var prisoner1 = Prisoner(score: 0, strategy: StrategyCatalog.Cooperator)
        @State var prisoner2 = Prisoner(score: 0, strategy: StrategyCatalog.Cooperator)
        @State var defectSwitch = DefectSwitch()
        
        var body: some View {
            EraseScoresButton(
                prisoner1: $prisoner1,
                prisoner2: $prisoner2,
                defectSwitch: $defectSwitch
            )
        }
    }
    return Preview()
}
