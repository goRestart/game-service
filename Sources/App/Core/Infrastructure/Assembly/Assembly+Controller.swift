import CoreService

extension Assembly {
  var gameRouteCollection: GameRouteCollection {
    return GameRouteCollection(
      gameController: gameController,
      searchController: searchController,
      gameConsoleController: gameConsoleController
    )
  }
  
  private var gameController: GameController {
    return GameController(
      gameViewMapper: gameViewMapper
    )
  }
  
  private var searchController: SearchController {
    return SearchController(
      searchGames: searchGames,
      gameViewMapper: gameViewMapper
    )
  }
  
  private var gameConsoleController: GameConsoleController {
    return GameConsoleController(
      getAllGameConsoles: getAllGameConsoles,
      getGameConsoleById: getGameConsoleById,
      viewMapper: gameConsoleViewMapper
    )
  }
}
