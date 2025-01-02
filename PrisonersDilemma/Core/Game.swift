import Foundation

class Game: ObservableObject {
    @Published var prisoner1: Prisoner
    @Published var prisoner2: Prisoner
    private let scoringRules: Scoring
    
    init(
        prisoner1: Prisoner,
        prisoner2: Prisoner,
        scoringRules: Scoring
    ) {
        self.prisoner1 = prisoner1
        self.prisoner2 = prisoner2
        self.scoringRules = scoringRules
    }
    
    private func computeScores(
        prisoner1Action: Action,
        prisoner2Action: Action
    ) -> (Int, Int) {
        switch(prisoner1Action, prisoner2Action) {
        case (.cooperate, .cooperate):
            return scoringRules.bothCooperate
        case (.defect, .defect):
            return scoringRules.bothDefect
        case (.cooperate, .defect):
            return scoringRules.prisoner1CooperatesPrisoner2Defects
        case (.defect, .cooperate):
            return scoringRules.prisoner1DefectsPrisoner2Cooperates
        }
    }
    
    public func play(iterations: Int = 1) {
        for _ in 0...iterations {
            let scores = computeScores(
                prisoner1Action: prisoner1.action,
                prisoner2Action: prisoner2.action
            )
            prisoner1.score += scores.0
            prisoner2.score += scores.1
        }
    }
    
    public static let Default = Game(
        prisoner1: PrisonerCatalog.Cooperator,
        prisoner2: PrisonerCatalog.Defector,
        scoringRules: Standard()
    )
}
