import Foundation

@Observable
class ViewModel {
    var exerciseIndexes: [Int]
    
    init() {
        self.exerciseIndexes = UserDefaults.standard.loadAndDecode(fromKey: UserDefaultsKey.exerciseIndexes, withDefault: Exercise.randomIndexArray())
    }
    
    deinit {
        try? UserDefaults.standard.encodeAndSet(exerciseIndexes, forKey: UserDefaultsKey.exerciseIndexes)
    }
    
    enum UserDefaultsKey: String, UserDefaultsSaveKey {
        case exerciseIndexes
    }
}
