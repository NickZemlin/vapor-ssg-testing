import Vapor

func routes(_ app: Application) throws {
//    app.get { req async in
//        "It works!"
//    }

    app.get { req async throws in
//        Middleware на получение последних 10 постов
//        посты прокинуть в словарь
        try await req.view.render("homePage", ["name": "Leaf"])
    }

//    app.get("posts") { req async throws -> [PostModel] in
//        
//        return []
//    }

//    app.get("hello") { req async throws -> View in
//        return try await req.view.render("homeLayout", ["name" : "Leaf"])
//    }
}
