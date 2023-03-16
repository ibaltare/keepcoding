import Foundation

struct ExerciseModel: Decodable {
    let id: Int
    let img: String
    let name: String
    let level: String
}

struct ExerciseDetailModel: Decodable {
    let video: String
    let name: String
    let description: String
}
