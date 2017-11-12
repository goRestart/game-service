import CoreService

extension Assembly {
  var gameRouteCollection: GameRouteCollection {
    return GameRouteCollection(
      searchController: searchController,
      gameConsoleController: gameConsoleController
    )
  }
  
  private var searchController: SearchController {
    return SearchController(
      searchGames: searchGames
    )
  }
  
  private var gameConsoleController: GameConsoleController {
    return GameConsoleController(
      getAllGameConsoles: getAllGameConsoles,
      viewMapper: gameConsoleViewMapper
    )
  }
}
