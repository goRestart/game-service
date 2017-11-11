import Vapor

private struct Endpoint {
  static let gameConsole = "/game-console"
}

struct GameRouteCollection: RouteCollection {
  
  private let gameController: GameController
  
  init(gameController: GameController) {
    self.gameController = gameController
  }
  
  func build(_ builder: RouteBuilder) throws {
    builder.get(Endpoint.gameConsole) { _ in
      return try self.gameController.gameConsoleList()
    }
  }
}
