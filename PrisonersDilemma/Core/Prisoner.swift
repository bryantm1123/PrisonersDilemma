import Foundation

public enum Action {
    case cooperate
    case defect
}

public protocol Prisoner {
    var name: String { get }
    var score: Int { get set }
    
    func action() -> Action
    func reaction(to: Action) -> Action
}

public struct PrisonerCatelog {
    struct Cooperator: Prisoner {
        var name: String = "Cooperator Gator"
        var score: Int = 0
    
        func action() -> Action {
            .cooperate
        }
        
        func reaction(to: Action) -> Action {
            .cooperate
        }
    }
    
    struct Defector: Prisoner {
        var name: String = "Defectorator"
        var score: Int = 0
        
        func action() -> Action {
            .defect
        }
        
        func reaction(to: Action) -> Action {
            .defect
        }
    }
}


