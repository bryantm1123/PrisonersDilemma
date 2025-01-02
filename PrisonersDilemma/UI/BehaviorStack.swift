import SwiftUI

struct BehaviorStack: View {
    @Binding var selectedBehavior: Behavior
    private let behaviors = BehaviorCatalog.behaviors
    
    var body: some View {
        VStack {
            Picker(
                selection: $selectedBehavior) {
                    ForEach(behaviors) { prisoner in
                        Text(prisoner.name).tag(prisoner)
                    }
                } label: {
                    Text("")
                }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Text("\(selectedBehavior.description)")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

#Preview {
    struct Preview: View {
        @State var prisoner = Prisoner(score: 0, behavior: BehaviorCatalog.Cooperator)
        var body: some View {
            BehaviorStack(selectedBehavior: $prisoner.behavior)
        }
    }
    return Preview()
}
