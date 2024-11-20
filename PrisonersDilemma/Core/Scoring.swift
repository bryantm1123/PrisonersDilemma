import Foundation

protocol Scoring {
    var bothCooperate: (Int, Int) { get }
    var bothDefect: (Int, Int) { get }
    var prisoner1CooperatesPrisoner2Defects: (Int, Int) { get }
    var prisoner1DefectsPrisoner2Cooperates: (Int, Int) { get }
}

struct Standard: Scoring {
    let bothCooperate: (Int, Int) = (3, 3)
    let bothDefect: (Int, Int) = (1, 1)
    let prisoner1CooperatesPrisoner2Defects: (Int, Int) = (0, 5)
    let prisoner1DefectsPrisoner2Cooperates: (Int, Int) = (5, 0)
}
