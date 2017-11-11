import Vapor

private struct Endpoint {
  static let gameConsole = "/game-console"
}

struct GameRouteCollection: RouteCollection {
  
  func build(_ builder: RouteBuilder) throws {
    builder.get(Endpoint.gameConsole) { _ in
      return "ok"
    }
  }
}
