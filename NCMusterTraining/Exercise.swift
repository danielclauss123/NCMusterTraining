import Foundation

struct Exercise: Identifiable {
    let id: Int
    let solution: String
    
    var questionImage: String {
        "ex\(id)_question"
    }
    
    var answerImages: [String] {
        [
            "ex\(id)_answer_a",
            "ex\(id)_answer_b",
            "ex\(id)_answer_c",
            "ex\(id)_answer_d",
            "ex\(id)_answer_e"
        ]
    }
    
    static let exercises: [Exercise] = [
        // 2024 Muster zuordnen 02
        .init(id: 1, solution: "d"),
        .init(id: 2, solution: "c"),
        .init(id: 3, solution: "d"),
        .init(id: 4, solution: "e"),
        .init(id: 5, solution: "b"),
        .init(id: 6, solution: "b"),
        .init(id: 7, solution: "c"),
        .init(id: 8, solution: "e"),
        .init(id: 9, solution: "e"),
        .init(id: 10, solution: "b"),
        .init(id: 11, solution: "e"),
        .init(id: 12, solution: "c"),
        .init(id: 13, solution: "a"),
        .init(id: 14, solution: "d"),
        .init(id: 15, solution: "b"),
        .init(id: 16, solution: "d"),
        .init(id: 17, solution: "c"),
        .init(id: 18, solution: "e"),
        
        // 2024 Muster zuordnen 03
        .init(id: 19, solution: "c"),
        .init(id: 20, solution: "d"),
        .init(id: 21, solution: "a"),
        .init(id: 22, solution: "a"),
        .init(id: 23, solution: "c"),
        .init(id: 24, solution: "b"),
        .init(id: 25, solution: "c"),
        .init(id: 26, solution: "b"),
        .init(id: 27, solution: "d"),
        .init(id: 28, solution: "b"),
        .init(id: 29, solution: "d"),
        .init(id: 30, solution: "c"),
        .init(id: 31, solution: "a"),
        .init(id: 32, solution: "c"),
        .init(id: 33, solution: "e"),
        .init(id: 34, solution: "e"),
        .init(id: 35, solution: "b"),
        .init(id: 36, solution: "c"),
        
        // 2022 Muster zuordnen 01
        .init(id: 37, solution: "b"),
        .init(id: 38, solution: "a"),
        .init(id: 39, solution: "e"),
        .init(id: 40, solution: "e"),
        .init(id: 41, solution: "b"),
        .init(id: 42, solution: "b"),
        .init(id: 43, solution: "e"),
        .init(id: 44, solution: "a"),
        .init(id: 45, solution: "b"),
        .init(id: 46, solution: "c"),
        .init(id: 47, solution: "b"),
        .init(id: 48, solution: "e"),
        .init(id: 49, solution: "c"),
        .init(id: 50, solution: "b"),
        .init(id: 51, solution: "d"),
        .init(id: 52, solution: "e"),
        .init(id: 53, solution: "c"),
        .init(id: 54, solution: "a"),
        
        // 2022 Muster zuordnen 02
        .init(id: 55, solution: "b"),
        .init(id: 56, solution: "a"),
        .init(id: 57, solution: "e"),
        .init(id: 58, solution: "c"),
        .init(id: 59, solution: "c"),
        .init(id: 60, solution: "a"),
        .init(id: 61, solution: "e"),
        .init(id: 62, solution: "b"),
        .init(id: 63, solution: "d"),
        .init(id: 64, solution: "b"),
        .init(id: 65, solution: "b"),
        .init(id: 66, solution: "b"),
        .init(id: 67, solution: "c"),
        .init(id: 68, solution: "c"),
        .init(id: 69, solution: "d"),
        .init(id: 70, solution: "a"),
        .init(id: 71, solution: "e"),
        .init(id: 72, solution: "d"),
        
        // 2021 Muster zuordnen 01
        .init(id: 73, solution: "b"),
        .init(id: 74, solution: "b"),
        .init(id: 75, solution: "c"),
        .init(id: 76, solution: "b"),
        .init(id: 77, solution: "e"),
        .init(id: 78, solution: "b"),
        .init(id: 79, solution: "e"),
        .init(id: 80, solution: "c"),
        .init(id: 81, solution: "a"),
        .init(id: 82, solution: "b"),
        .init(id: 83, solution: "e"),
        .init(id: 84, solution: "b"),
        .init(id: 85, solution: "c"),
        .init(id: 86, solution: "c"),
        .init(id: 87, solution: "a"),
        .init(id: 88, solution: "a"),
        .init(id: 89, solution: "d"),
        .init(id: 90, solution: "a"),
        .init(id: 91, solution: "a"),
        .init(id: 92, solution: "e")
    ]
    
    static func randomIndexArray() -> [Int] {
        Array(0 ..< exercises.count).shuffled()
    }
}
