import Testing
import Foundation
@testable import PrisonersDilemma

struct BehaviorCatelogTests {

    @Test func CooperateBehaviorAlwaysReactsWithCooperateAction() {
        let cooperationBehavior = BehaviorCatelog.Cooperation
        
        var reaction = cooperationBehavior.reaction(.cooperate)
        #expect(reaction == .cooperate)
        
        reaction = cooperationBehavior.reaction(.defect)
        #expect(reaction == .cooperate)
    }
    
    @Test func DefectionBehaviorAlwaysReactsWithDefectionAction() {
        let defectionBehavior = BehaviorCatelog.Defection
        
        var reaction = defectionBehavior.reaction(.cooperate)
        #expect(reaction == .defect)
        
        reaction = defectionBehavior.reaction(.defect)
        #expect(reaction == .defect)
    }
    
    @Test func TitForTatBehaviorAlwaysReactsWithOpponentsPreviousAction() {
        let titForTatBehavior = BehaviorCatelog.TitForTat
        
        var reaction = titForTatBehavior.reaction(.cooperate)
        #expect(reaction == .cooperate)
        
        reaction = titForTatBehavior.reaction(.defect)
        #expect(reaction == .defect)
    }
    
    @Test func NeverForgetBehaviorCooperatesUnlessOpponentDefects() {
        UserDefaults().set(0, forKey: "defectSwitch")
        
        let neverForgetBehavior = BehaviorCatelog.NeverForget
        var reaction: Action
        var runCount = 0
        
        reaction = neverForgetBehavior.reaction(.cooperate)
        #expect(reaction == .cooperate)
        
        reaction = neverForgetBehavior.reaction(.defect)
        #expect(reaction == .defect)
        
        while runCount < 3 { // always defects from now on
            runCount += 1
            reaction = neverForgetBehavior.reaction(.cooperate)
            #expect(reaction == .defect)
        }
    }
    
    @Test func WildCardChoosesToCooperateOrDefectAtRandom() {
        let wildCardBehavior = BehaviorCatelog.WildCard
        var reaction: Action = .cooperate
        var cooperateCount = 0
        var defectCount = 0
        var runCount = 0
        
        while runCount < 99 {
            reaction = wildCardBehavior.reaction(.cooperate)
            if reaction == .cooperate {
                cooperateCount += 1
            } else {
                defectCount += 1
            }
            runCount += 1
        }
        
        #expect(reaction == .cooperate || reaction == .defect)
        #expect((0...99).contains(cooperateCount))
        #expect((0...99).contains(defectCount))
    }
}
