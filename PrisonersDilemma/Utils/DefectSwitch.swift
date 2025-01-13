import Foundation

final class DefectSwitch {
    private let switchName = "defectSwitch"
    private var storage: UserDefaults
    
    enum SwitchState {
        case on, off
        
        var boolValue: Bool {
            switch self {
            case .on: return true
            case .off: return false
            }
        }
        
        init?(rawValue: Bool) {
            switch rawValue {
            case true: self = .on
            case false: self = .off
            }
        }
    }
    
    init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
        removeSwitch()
        setSwitch(to: .off)
    }
    
    func setSwitch(to: SwitchState) {
        let currentSwitchState = SwitchState(rawValue: storage.bool(forKey: switchName))
        if currentSwitchState != to {
            storage.set(to.boolValue, forKey: switchName)
        }
    }
    
    func getSwitchState() -> SwitchState {
        let rawState = storage.bool(forKey: switchName)
        return SwitchState(rawValue: rawState) ?? .off
    }
    
    private func removeSwitch() {
        storage.removeObject(forKey: switchName)
    }
}
