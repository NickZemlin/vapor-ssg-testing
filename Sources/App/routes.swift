import Vapor

func buildHomePage() async -> HomePageContext {
//    Middleware на получение последних 10 постов
    return HomePageContext.mock()
}

func routes(_ app: Application) throws {
//    app.get { req async in
//        "It works!"
//    }

    app.get { req async throws in

        return try await req.view.render("homePage", await buildHomePage())
    }

//    app.get("posts") { req async throws -> [PostModel] in
//        
//        return []
//    }

//    app.get("hello") { req async throws -> View in
//        return try await req.view.render("homeLayout", ["name" : "Leaf"])
//    }
}
