import Vapor

func buildHomePage() async -> HomePageContext {
//    Middleware на получение последних 10 постов
    return HomePageContext.mock()
}

func routes(_ app: Application) throws {

    app.get { req async throws in
        return try await req.view.render("homePage", await buildHomePage())
    }

    app.get("404") { req async throws in
        return try await req.view.render("page404")
    }
    
    app.get("**") {req async throws in
        req.redirect(to: "/404")
    }

//    app.get("posts") { req async throws -> [PostModel] in
//        
//        return []
//    }

//    app.get("hello") { req async throws -> View in
//        return try await req.view.render("homeLayout", ["name" : "Leaf"])
//    }
}
