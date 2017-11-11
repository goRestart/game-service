import Vapor

private struct Endpoint {
  static let gameConsole = "/game-console"
}

struct GameRouteCollection: RouteCollection {
  
  private let gameConsoleController: GameConsoleController
  
  init(gameConsoleController: GameConsoleController) {
    self.gameConsoleController = gameConsoleController
  }
  
  func build(_ builder: RouteBuilder) throws {
    builder.get(Endpoint.gameConsole) { _ in
      return try self.gameConsoleController.getAll()
    }
  }
}
