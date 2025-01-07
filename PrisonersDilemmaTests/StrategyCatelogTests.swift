import Testing
@testable import PrisonersDilemma

struct StrategyCatelogTests {

    @Test func CooperatorStrategyHasCooperationBehavior() {
        let cooperationStrategy = StrategyCatalog.Cooperator
        #expect(cooperationStrategy.behavior == BehaviorCatelog.Cooperation)
    }
    
    @Test func DefectorStrategyHasDefectionBehavior() {
        let defectionStrategy = StrategyCatalog.Defector
        #expect(defectionStrategy.behavior == BehaviorCatelog.Defection)
    }

    @Test func TitForTatStrategyHasTitForTatBehavior() {
        let titForTatStrategy = StrategyCatalog.TitForTat
        #expect(titForTatStrategy.behavior == BehaviorCatelog.TitForTat)
    }
    
    @Test func NeverForgetsStrategyHasNeverForgetsBehavior() {
        let neverForgetsStrategy = StrategyCatalog.NeverForgets
        #expect(neverForgetsStrategy.behavior == BehaviorCatelog.NeverForget)
    }
    
    @Test func WildCardStrategyHasWildCardBehavior() {
        let wildCardStrategy = StrategyCatalog.WildCard
        #expect(wildCardStrategy.behavior == BehaviorCatelog.WildCard)
    }
}
