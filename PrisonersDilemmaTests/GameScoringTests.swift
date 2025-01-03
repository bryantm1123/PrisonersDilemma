import Testing
import XCTest
@testable import PrisonersDilemma

struct GameScoringTests {

    // Single iterations
    @Test func testBothCooperateGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Cooperator),
            prisoner2: Prisoner(strategy: StrategyCatalog.Cooperator),
            scoringRules: Standard()
        )
        
        game.play()
        
        XCTAssertEqual(game.prisoner1.score, 3)
        XCTAssertEqual(game.prisoner2.score, 3)
    }
    
    @Test func testBothDefectGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Defector),
            prisoner2: Prisoner(strategy: StrategyCatalog.Defector),
            scoringRules: Standard()
        )
        
        game.play()
        
        XCTAssertEqual(game.prisoner1.score, 1)
        XCTAssertEqual(game.prisoner2.score, 1)
    }
    
    @Test func testPrisonerOneCooperatesPrisonerTwoDefectsGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Cooperator),
            prisoner2: Prisoner(strategy: StrategyCatalog.Defector),
            scoringRules: Standard()
        )
        
        game.play()
        
        XCTAssertEqual(game.prisoner1.score, 0)
        XCTAssertEqual(game.prisoner2.score, 5)
    }
    
    @Test func testPrisonerOneDefectsPrisonerTwoCooperatesGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Defector),
            prisoner2: Prisoner(strategy: StrategyCatalog.Cooperator),
            scoringRules: Standard()
        )
        
        game.play()
        
        XCTAssertEqual(game.prisoner1.score, 5)
        XCTAssertEqual(game.prisoner2.score, 0)
    }
    
    // Multiple iterations
    @Test func testPrisonerOneDefectsPrisonerTwoCooperatesGivesExpectedResultOverIteration() {
        let game = Game(
            prisoner1: Prisoner(strategy: StrategyCatalog.Defector),
            prisoner2: Prisoner(strategy: StrategyCatalog.Cooperator),
            scoringRules: Standard()
        )
        
        game.play(iterations: 5)
        
        XCTAssertEqual(game.prisoner1.score, 25)
        XCTAssertEqual(game.prisoner2.score, 0)
    }
}
