import Foundation

public enum Action {
    case cooperate
    case defect
}

public struct Prisoner: Identifiable, Hashable, Equatable {
    public static func == (lhs: Prisoner, rhs: Prisoner) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.score == rhs.score &&
        lhs.action == rhs.action
    }
    
    public let id: UUID = UUID()
    public var name: String
    public var score: Int
    public var action: Action
}

public struct PrisonerCatalog {
    static let prisoners: [Prisoner] = [Cooperator, Defector]
    
    static let Cooperator = Prisoner(
        name: "Cooperator Gator",
        score: 0,
        action: .cooperate
    )
    
    static let Defector = Prisoner(
        name: "Defectorator",
        score: 0,
        action: .defect
    )
}


