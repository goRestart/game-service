import Foundation

struct GameConsoleDiskDataSource: GameConsoleDataSource {
  
  private let getGameConsoleListTask: GetGameConsoleListTask
  private let gameConsoleMapper: GameConsoleMapper
  
  init(getGameConsoleListTask: GetGameConsoleListTask,
       gameConsoleMapper: GameConsoleMapper)
  {
    self.getGameConsoleListTask = getGameConsoleListTask
    self.gameConsoleMapper = gameConsoleMapper
  }
  
  func getAll() throws -> [GameConsole] {
    return try gameConsoleMapper.map(
      elements: try getGameConsoleListTask.execute()
    )
  }
}
