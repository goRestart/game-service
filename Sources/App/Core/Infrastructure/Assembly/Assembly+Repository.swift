import CoreService

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
