import Testing
import XCTest
@testable import PrisonersDilemma

struct GameScoringTests {

    // Single iterations
    @Test func bothCooperateUsingStandardScoring() {
        let game = Game(
            prisoner1: Prisoner(score: 0, strategy: StrategyCatalog.Cooperator),
            prisoner2: Prisoner(score: 0, strategy: StrategyCatalog.Cooperator),
            scoringRules: Standard()
        )
        
        game.play()
        
        #expect(game.prisoner1.score == 3)
        #expect(game.prisoner2.score == 3)
    }
    
    @Test func bothDefectUsingStandardScoring() {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Defector),
            prisoner2: Prisoner(strategy: StrategyCatalog.Defector),
            scoringRules: Standard()
        )
        
        game.play()
        
        #expect(game.prisoner1.score == 1)
        #expect(game.prisoner2.score == 1)
    }
    
    @Test func prisonerOneCooperatesPrisonerTwoDefectsUsingStandardScoring() {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Cooperator),
            prisoner2: Prisoner(strategy: StrategyCatalog.Defector),
            scoringRules: Standard()
        )
        
        game.play()
        
        #expect(game.prisoner1.score == 0)
        #expect(game.prisoner2.score == 5)
    }
    
    @Test func prisonerOneDefectsPrisonerTwoCooperatesUsingStandardScoring() {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Defector),
            prisoner2: Prisoner(strategy: StrategyCatalog.Cooperator),
            scoringRules: Standard()
        )
        
        game.play()
        
        #expect(game.prisoner1.score == 5)
        #expect(game.prisoner2.score == 0)
    }
    
    // Multiple iterations
    @Test func prisonerOneDefectsPrisonerTwoCooperatesUsingStandardScoringOverIteration() {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Defector),
            prisoner2: Prisoner(strategy: StrategyCatalog.Cooperator),
            scoringRules: Standard()
        )
        
        game.play(iterations: 4)
        
        #expect(game.prisoner1.score == 25)
        #expect(game.prisoner2.score == 0)
    }
}
