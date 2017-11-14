import Fluent
import CoreService

struct GetGameConsoleByIdTask {
  
  func execute(_ identifier: CoreService.Identifier<GameConsole>) throws -> GameConsoleDiskModel {
    guard let gameConsole = try GameConsoleDiskModel.find(identifier.value) else {
      throw GameConsoleError.notFound
    }
    return gameConsole
  }
}
