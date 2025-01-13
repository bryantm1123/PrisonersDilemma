import Foundation

class UserDefaultsMock: UserDefaults {
    var storage = [String:Any]()
    
    override func set(_ value: Bool, forKey defaultName: String) {
        storage[defaultName] = value
    }
    
    override func bool(forKey defaultName: String) -> Bool {
        storage[defaultName] as? Bool ?? false
    }
}
