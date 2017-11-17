import CoreService

struct GameConsoleDiskDataSource: GameConsoleDataSource {
  
  private let getGameConsoleListTask: GetGameConsoleListTask
  private let getGameConsoleByIdTask: GetGameConsoleByIdTask
  private let gameConsoleMapper: GameConsoleMapper
  
  init(getGameConsoleListTask: GetGameConsoleListTask,
       getGameConsoleByIdTask: GetGameConsoleByIdTask,
       gameConsoleMapper: GameConsoleMapper)
  {
    self.getGameConsoleListTask = getGameConsoleListTask
    self.getGameConsoleByIdTask = getGameConsoleByIdTask
    self.gameConsoleMapper = gameConsoleMapper
  }
  
  func getBy(_ identifier: Identifier<GameConsole>) throws -> GameConsole {
    return try gameConsoleMapper.map(
      try getGameConsoleByIdTask.execute(with: identifier)
    )
  }
  
  func getAll() throws -> [GameConsole] {
    return try gameConsoleMapper.map(
      elements: try getGameConsoleListTask.execute()
    )
  }
}
