import Testing
@testable import PrisonersDilemma

final class BehaviorCatelogTests {
    
    var defectSwitch: DefectSwitch?
    let storageMock = UserDefaultsMock()
    
    init() {
        defectSwitch = DefectSwitch(storage: storageMock)
    }

    @Test func CooperateBehaviorAlwaysReactsWithCooperateAction() {
        let cooperationBehavior = BehaviorCatelog.Cooperation
        
        var reaction = cooperationBehavior.reaction(.cooperate, defectSwitch)
        #expect(reaction == .cooperate)
        
        reaction = cooperationBehavior.reaction(.defect, defectSwitch)
        #expect(reaction == .cooperate)
    }
    
    @Test func DefectionBehaviorAlwaysReactsWithDefectionAction() {
        let defectionBehavior = BehaviorCatelog.Defection
        
        var reaction = defectionBehavior.reaction(.cooperate, defectSwitch)
        #expect(reaction == .defect)
        
        reaction = defectionBehavior.reaction(.defect, defectSwitch)
        #expect(reaction == .defect)
    }
    
    @Test func TitForTatBehaviorAlwaysReactsWithOpponentsPreviousAction() {
        let titForTatBehavior = BehaviorCatelog.TitForTat
        
        var reaction = titForTatBehavior.reaction(.cooperate, defectSwitch)
        #expect(reaction == .cooperate)
        
        reaction = titForTatBehavior.reaction(.defect, defectSwitch)
        #expect(reaction == .defect)
    }
    
    @Test func NeverForgetBehaviorCooperatesUnlessOpponentDefects() {
        let neverForgetBehavior = BehaviorCatelog.NeverForget
        var reaction: Action
        var runCount = 0
        
        reaction = neverForgetBehavior.reaction(.cooperate, defectSwitch)
        #expect(reaction == .cooperate)
        
        reaction = neverForgetBehavior.reaction(.defect, defectSwitch)
        #expect(reaction == .defect)
        
        // always defects from now on
        while runCount < 3 {
            runCount += 1
            reaction = neverForgetBehavior.reaction(.cooperate, defectSwitch)
            #expect(reaction == .defect)
        }
        
        // unless defect switch is reset
        defectSwitch?.setSwitch(to: .off)
        reaction = neverForgetBehavior.reaction(.cooperate, defectSwitch)
        #expect(reaction == .cooperate)
    }
    
    @Test func WildCardChoosesToCooperateOrDefectAtRandom() {
        let wildCardBehavior = BehaviorCatelog.WildCard
        var reaction: Action = .cooperate
        var cooperateCount = 0
        var defectCount = 0
        var runCount = 0
        
        while runCount < 99 {
            reaction = wildCardBehavior.reaction(.cooperate, defectSwitch)
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
    
    deinit {
        defectSwitch = nil
    }
}
