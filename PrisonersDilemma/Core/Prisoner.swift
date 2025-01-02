import Foundation

enum Action {
    case cooperate
    case defect
}

struct Prisoner: Identifiable, Hashable, Equatable {
    static func == (lhs: Prisoner, rhs: Prisoner) -> Bool {
        lhs.id == rhs.id &&
        lhs.score == rhs.score &&
        lhs.behavior.name == rhs.behavior.name &&
        lhs.behavior.description == rhs.behavior.description &&
        lhs.behavior.action == rhs.behavior.action
    }
    
    let id: UUID = UUID()
    var score: Int
    var behavior: Behavior
}

struct Behavior: Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let action: Action
}

struct BehaviorCatalog {
    static let behaviors: [Behavior] = [Cooperator, Defector]
    
    static let Cooperator = Behavior(
        name: "Cooperator Gator",
        description: "Cooperator Gator sees only the good in everyone and therefore always cooperates. This gator doesn't believe in payback or revenge for any betrayals.",
        action: .cooperate
    )
    
    static let Defector = Behavior(
        name: "Defectorator",
        description: "The Defectorator doesn't trust anyone and will turn on them in a heartbeat! Always expect a betrayal out of this one.",
        action: .defect
    )
}


