import Testing
import XCTest
@testable import PrisonersDilemma

struct PrisonersDilemmaTests {

    @Test func testPlayingOneRoundGivesExpectedResult() async throws {
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

}
