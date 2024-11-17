import Foundation

protocol Scoring {
    var bothCooperate: (Int, Int) { get }
    var bothDefect: (Int, Int) { get }
    var player1CooperatesPlayer2Defects: (Int, Int) { get }
    var player1DefectsPlayer2Cooperates: (Int, Int) { get }
}

struct Standard: Scoring {
    let bothCooperate: (Int, Int) = (3, 3)
    let bothDefect: (Int, Int) = (1, 1)
    let player1CooperatesPlayer2Defects: (Int, Int) = (0, 5)
    let player1DefectsPlayer2Cooperates: (Int, Int) = (5, 0)
}
