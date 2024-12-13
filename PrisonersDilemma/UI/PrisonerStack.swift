import SwiftUI

struct PrisonerStack: View {
    @Binding var prisoner: Prisoner
    private let prisoners = PrisonerCatalog.prisoners
    
    var body: some View {
        VStack {
            Picker(
                selection: $prisoner) {
                    ForEach(prisoners) { prisoner in
                        Text(prisoner.name).tag(prisoner)
                    }
                } label: {
                    Text("")
                }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Text("\(prisoner.description)")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
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
