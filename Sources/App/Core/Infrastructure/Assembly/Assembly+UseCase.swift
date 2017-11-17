import CoreService

extension Assembly {
  var getGameById: GetGameById {
    return GetGameById(
      gameRepository: gameRepository
    )
  }
  
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
