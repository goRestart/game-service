import CoreService

// MARK: - Game

extension Assembly {
  var gameRepository: GameRepository {
    return GameRepository(
      diskDataSource: gameDiskDataSource
    )
  }
  
  private var gameDiskDataSource: GameDiskDataSource {
    return GameDiskDataSource(
      searchGamesTask: searchGamesTask,
      gameMapper: gameMapper
    )
  }
  
  // MARK - Tasks
  
  private var searchGamesTask: SearchGamesTask {
    return SearchGamesTask()
  }
}


// MARK: - Game console

extension Assembly {
  var gameConsoleRepository: GameConsoleRepository {
    return GameConsoleRepository(
      diskDataSource: gameConsoleDiskDataSource
    )
  }
  
  private var gameConsoleDiskDataSource: GameConsoleDataSource {
    return GameConsoleDiskDataSource(
      getGameConsoleListTask: gameConsoleListTask,
      gameConsoleMapper: gameConsoleMapper
    )
  }
  
  // MARK - Tasks
  
  private var gameConsoleListTask: GetGameConsoleListTask {
    return GetGameConsoleListTask()
  }
}
