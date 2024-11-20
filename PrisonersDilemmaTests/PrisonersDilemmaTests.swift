import Testing
import XCTest
@testable import PrisonersDilemma

struct PrisonersDilemmaTests {

    @Test func testBothCooperateGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: PrisonerCatelog.Cooperator(),
            prisoner2: PrisonerCatelog.Cooperator(),
            scoringRules: Standard()
        )
        
        game.play()
        
        let prisoner1Score = game.getScores().0
        let prisoner2Score = game.getScores().1
        
        XCTAssertEqual(prisoner1Score, 3)
        XCTAssertEqual(prisoner2Score, 3)
    }
    
    @Test func testBothDefectGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: PrisonerCatelog.Defector(),
            prisoner2: PrisonerCatelog.Defector(),
            scoringRules: Standard()
        )
        
        game.play()
        
        let prisoner1Score = game.getScores().0
        let prisoner2Score = game.getScores().1
        
        XCTAssertEqual(prisoner1Score, 1)
        XCTAssertEqual(prisoner2Score, 1)
    }
    
    @Test func testPrisonerOneCooperatesPrisonerTwoDefectsGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: PrisonerCatelog.Cooperator(),
            prisoner2: PrisonerCatelog.Defector(),
            scoringRules: Standard()
        )
        
        game.play()
        
        let prisoner1Score = game.getScores().0
        let prisoner2Score = game.getScores().1
        
        XCTAssertEqual(prisoner1Score, 0)
        XCTAssertEqual(prisoner2Score, 5)
    }
    
    @Test func testPrisonerOneDefectsPrisonerTwoCooperatesGivesExpectedResult() async throws {
        let game = Game(
            prisoner1: PrisonerCatelog.Defector(),
            prisoner2: PrisonerCatelog.Cooperator(),
            scoringRules: Standard()
        )
        
        game.play()
        
        let prisoner1Score = game.getScores().0
        let prisoner2Score = game.getScores().1
        
        XCTAssertEqual(prisoner1Score, 5)
        XCTAssertEqual(prisoner2Score, 0)
    }

}
