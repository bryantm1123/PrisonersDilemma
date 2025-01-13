import Testing
import Foundation
@testable import PrisonersDilemma

final class DefectSwitchTests {
    
    var defectSwitch: DefectSwitch?
    let storageMock = UserDefaultsMock()

    init() {
        defectSwitch = DefectSwitch(storage: storageMock)
    }
    
    @Test func defectSwitchInitializesToOff() {
        #expect(defectSwitch?.getSwitchState() == .off)
    }
    
    @Test func defectSwitchCanBeSwitchedOn() {
        defectSwitch?.setSwitch(to: .on)
        #expect(defectSwitch?.getSwitchState() == .on)
    }
    
    @Test func defectSwitchCanBeSwitchedOffAfterBeingSwitchedOn() {
        defectSwitch?.setSwitch(to: .on)
        defectSwitch?.setSwitch(to: .off)
        #expect(defectSwitch?.getSwitchState() == .off)
    }
    
    deinit {
        defectSwitch = nil
    }
}
