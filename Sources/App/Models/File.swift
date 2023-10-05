import Vapor

enum UserRoles: String, Encodable {
    case user = "USER"
    case admin = "ADMIN"
}

struct AuthorModel: Equatable, Identifiable, Encodable {
    let name: String
    let id: Int
    let imageUrl: String?

    static func == (lhs: AuthorModel, rhs: AuthorModel) -> Bool {
        lhs.id == rhs.id
    }
    
    enum CodingKeys: CodingKey {
        case name
        case id
        case imageUrl
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imageUrl, forKey: .imageUrl)
    }
    
    
}

struct PostModel: Identifiable, Encodable {
    let id: Int
    let author: AuthorModel
    let title: String
    let createdAt: Int
    var timeParsed: String {
        return String(self.createdAt)
    }
    let abstract: String

    enum CodingKeys: CodingKey {
        case id
        case author
        case title
        case createdAt
        case abstract
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.author, forKey: .author)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.abstract, forKey: .abstract)
    }
    
}

struct HomePageContext: Encodable {
    var posts: [PostModel]
    let role: UserRoles
    

    
    enum CodingKeys: CodingKey {
        case posts
        case role
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(role, forKey: .role)
        try container.encode(posts, forKey: .posts)
    }

    static func mock() -> HomePageContext{
        let author = AuthorModel(name: "CringeAuthor", id: 1, imageUrl: nil)
        let mockTitle = "Mastering Observation framework in Swift"
        let abstract = "Today, we will discuss thread safety, an essential programming aspect. I decided to cover this topic because of the issue I’ve noticed in the codebase I helped to build. This type of bug is straightforward to create but very hard to fix. So investing time into building a type-safe type in your codebase is much better."
        let posts: [PostModel] = [
            .init(id: 1, author: author, title: mockTitle, createdAt: 1696518372, abstract: abstract),
            .init(id: 2, author: author, title: mockTitle, createdAt: 1696518372, abstract: abstract),
            .init(id: 3, author: author, title: mockTitle, createdAt: 1696518372, abstract: abstract),
            .init(id: 4, author: author, title: mockTitle, createdAt: 1696518372, abstract: abstract),
        ]
        return HomePageContext(posts: posts, role: .admin)
    }
}
