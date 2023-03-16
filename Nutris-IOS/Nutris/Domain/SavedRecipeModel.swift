
import Foundation

struct SavedRecipeModel {
    struct Public: Decodable {
        let image: String
        let userName: String
        let photo: String
        let desc: String
        let title: String
    }
}
