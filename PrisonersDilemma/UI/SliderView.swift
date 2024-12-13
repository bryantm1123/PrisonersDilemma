import SwiftUI

struct SliderView: View {
    @Binding var iterations: Double
    private let min = 1.0
    private let max = 20.0
    
    var body: some View {
        Slider(value: $iterations, in: min...max, step: 1.0) {
            Text("Iterations")
        } minimumValueLabel: {
            Text("\(Int(min))")
        } maximumValueLabel: {
            Text("\(Int(max))")
        }
    }
}

#Preview {
    struct Preview: View {
        @State var iterations = 1.0
        
        var body: some View {
            SliderView(iterations: $iterations)
        }
    }
    return Preview()
}
