import Foundation

struct Strategy: Identifiable, Hashable {
    static func == (lhs: Strategy, rhs: Strategy) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.imageName == rhs.imageName
    }
    
    let id: UUID = UUID()
    let name: String
    let description: String
    let imageName: String
    var behavior: Behavior
}

struct StrategyCatalog {
    static let strategies: [Strategy] = [
        Cooperator,
        Defector,
        TitForTat,
        NeverForgets,
        WildCard
    ]
    
    static let Cooperator = Strategy(
        name: "Cooperator Gator",
        description: "Cooperator Gator sees only the good in everyone and therefore always cooperates. This gator doesn't believe in payback or revenge for any betrayals.",
        imageName: "gator",
        behavior: BehaviorCatelog.Cooperation
    )
    
    static let Defector = Strategy(
        name: "Defectorator",
        description: "The Defectorator doesn't trust anyone and will turn on them in a heartbeat! Always expect a betrayal out of this one.",
        imageName: "wolf",
        behavior: BehaviorCatelog.Defection
    )
    
    // tit for tat - platypus - always does the other prisoner's last action
    static let TitForTat = Strategy(
        name: "Tit-for-tatypus",
        description: "The Tit-for-tatypus follows your lead. If you're nice, so is he. If not, he claps right back.",
        imageName: "platypus",
        behavior: BehaviorCatelog.TitForTat
    )
    
    // never forgets - elephant - initially cooperates; if defected upon, will only defect from that point on
    static let NeverForgets = Strategy(
        name: "Never-forgetter-Elephant",
        description: "This elephant never forgets and never forgives. One double-cross and you've made an enemy for life!",
        imageName: "elephant",
        behavior: BehaviorCatelog.NeverForget
    )
    
    // the wild card - monkey - randomly defects or cooperates
    static let WildCard = Strategy(
        name: "Wild Card",
        description: "You never know what this crazy monkey is gonna do...a total wild card!",
        imageName: "monkey",
        behavior: BehaviorCatelog.WildCard
    )
    
    // TODO: win-stay/lose-switch - chameleon - if wins round, next action stays the same. if loses round, picks one of the other actions at random.
    
}
