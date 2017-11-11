import CoreService

extension Assembly {
  var gameRouteCollection: GameRouteCollection {
    return GameRouteCollection(
      gameConsoleController: gameConsoleController
    )
  }
  
  private var gameConsoleController: GameConsoleController {
    return GameConsoleController(
      getAllGameConsoles: getAllGameConsoles,
      viewMapper: gameConsoleViewMapper
    )
  }
}
