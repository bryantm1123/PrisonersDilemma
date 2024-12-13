import SwiftUI

struct PrisonerStack: View {
    @Binding var prisoner: Prisoner
    private let prisoners = PrisonerCatalog.prisoners
    
    var body: some View {
        VStack {
            Text(prisoner.name)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .font(.title2)
            Picker(
                selection: $prisoner) {
                    ForEach(prisoners) { prisoner in
                        Text(prisoner.name).tag(prisoner)
                    }
                } label: {
                    Text("Play Style")
                }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

#Preview {
    struct Preview: View {
        @State var prisoner = PrisonerCatalog.Cooperator
        var body: some View {
            PrisonerStack(prisoner: $prisoner)
        }
    }
    return Preview()
}
