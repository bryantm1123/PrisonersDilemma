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
        
        UserDefaults().set(0, forKey: "defectSwitch")
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
    
    public func play(iterations: Int = 0) {
        for _ in 0...iterations {
            let scores = computeScores(
                prisoner1Action: prisoner1.strategy.behavior.action,
                prisoner2Action: prisoner2.strategy.behavior.action
            )
            prisoner1.score += scores.0
            prisoner2.score += scores.1
            
            reactToOpponentAction()
        }
    }
    
    public static let Default = Game(
        prisoner1: Prisoner(score: 0, strategy: StrategyCatalog.Cooperator),
        prisoner2: Prisoner(score: 0, strategy: StrategyCatalog.Defector),
        scoringRules: Standard()
    )
    
    private func reactToOpponentAction() {
        let prisoner1Action = prisoner1.strategy.behavior.action
        let prisoner2Action = prisoner2.strategy.behavior.action
        
        let prisoner1Reaction = prisoner1.strategy.behavior.reaction(prisoner2Action)
        let prisoner2Reaction = prisoner2.strategy.behavior.reaction(prisoner1Action)
        
        prisoner1.strategy.behavior.action = prisoner1Reaction
        prisoner2.strategy.behavior.action = prisoner2Reaction
    }
}
