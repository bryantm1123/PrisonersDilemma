import Foundation

enum Action {
    case cooperate
    case defect
}

struct Behavior: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(action)
    }

    static func == (lhs: Behavior, rhs: Behavior) -> Bool {
        lhs.action == rhs.action
    }
    var action: Action
    var reaction: (Action) -> Action
}

struct BehaviorCatelog {
    static let Cooperation = Behavior(
        action: .cooperate) { _ in
                .cooperate
        }
    
    static let Defection = Behavior(
        action: .defect) { _ in
                .defect
        }
    
    static let TitForTat = Behavior(
        action: .cooperate) { action in
            switch action {
            case .cooperate: return .cooperate
            case .defect: return .defect
            }
        }
    
    static let NeverForget = Behavior(
        action: .cooperate) { action in
            if action == .defect {
                UserDefaults().set(1, forKey: "defectSwitch")
            }
            
            let defectSwitchValue = UserDefaults().integer(forKey: "defectSwitch")
            if defectSwitchValue == 0 { return .cooperate }
            return .defect
        }
    
    static let WildCard = Behavior(
        action: .cooperate) { _ in
            var chance = Int.random(in: 0...99)
            if chance % 2 == 0 { return .cooperate }
            return .defect
        }
    
    // TODO: win-stay/lose-switch - chameleon - if wins round, next action stays the same. if loses round, picks one of the other behaviors at random.
}
