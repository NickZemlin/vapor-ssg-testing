import Vapor

struct AuthorModel: Equatable, Identifiable {
    let name: String
    let id: Int
    let imageUrl: String

    static func == (lhs: AuthorModel, rhs: AuthorModel) -> Bool {
        lhs.id == rhs.id
    }
}

struct PostModel: Identifiable {
    let id: Int
    let author: AuthorModel
    
}
