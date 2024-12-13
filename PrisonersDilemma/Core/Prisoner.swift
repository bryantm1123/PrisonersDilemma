import Foundation

public enum Action {
    case cooperate
    case defect
}

public struct Prisoner: Identifiable, Hashable, Equatable {
    public static func == (lhs: Prisoner, rhs: Prisoner) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.score == rhs.score &&
        lhs.action == rhs.action
    }
    
    public let id: UUID = UUID()
    public var name: String
    public var description: String
    public var score: Int
    public var action: Action
}

public struct PrisonerCatalog {
    static let prisoners: [Prisoner] = [Cooperator, Defector]
    
    static let Cooperator = Prisoner(
        name: "Cooperator Gator",
        description: "Cooperator Gator sees only the good in everyone and therefore always cooperates. This gator doesn't believe in payback or revenge for any betrayals.",
        score: 0,
        action: .cooperate
    )
    
    static let Defector = Prisoner(
        name: "Defectorator",
        description: "The Defectorator doesn't trust anyone and will turn on them in a heartbeat! Always expect a betrayal out of this one.",
        score: 0,
        action: .defect
    )
}


