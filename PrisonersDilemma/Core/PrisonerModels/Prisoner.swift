import Foundation

struct Prisoner: Identifiable, Equatable {
    static func == (lhs: Prisoner, rhs: Prisoner) -> Bool {
        lhs.id == rhs.id &&
        lhs.score == rhs.score &&
        lhs.strategy.name == rhs.strategy.name &&
        lhs.strategy.description == rhs.strategy.description
    }
    
    let id: UUID = UUID()
    var score: Int = 0
    var strategy: Strategy
}


