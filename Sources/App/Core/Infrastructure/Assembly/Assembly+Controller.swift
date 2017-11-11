import CoreService

extension Assembly {
  var gameRouteCollection: GameRouteCollection {
    return GameRouteCollection(
      gameController: gameController
    )
  }
  
  private var gameController: GameController {
    return GameController(
      getAllGameConsoles: getAllGameConsoles,
      viewMapper: gameConsoleViewMapper
    )
  }
}
