import Vapor

private struct Endpoint {
  static let search = "/search"
  static let gameConsole = "/game-console"
  static let gameConsoleById = "/game-console/:id"
}

struct GameRouteCollection: RouteCollection {
  
  private let searchController: SearchController
  private let gameConsoleController: GameConsoleController
  
  init(searchController: SearchController,
       gameConsoleController: GameConsoleController)
  {
    self.searchController = searchController
    self.gameConsoleController = gameConsoleController
  }
  
  func build(_ builder: RouteBuilder) throws {
    builder.get(Endpoint.search) { request in
      return try self.searchController.find(with: request)
    }
    builder.get(Endpoint.gameConsole) { _ in
      return try self.gameConsoleController.getAll()
    }
    builder.get(Endpoint.gameConsoleById) { request in
      return try self.gameConsoleController.getById(request)
    }
  }
}
