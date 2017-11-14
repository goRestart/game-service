import CoreService

extension Assembly {
  var searchGames: SearchGames {
    return SearchGames(
      gameRepository: gameRepository
    )
  }
  
  var getAllGameConsoles: GetAllGameConsoles {
    return GetAllGameConsoles(
      gameConsoleRepository: gameConsoleRepository
    )
  }
  
  var getGameConsoleById: GetGameConsoleById {
    return GetGameConsoleById(
      gameConsoleRepository: gameConsoleRepository
    )
  }
}
