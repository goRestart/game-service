import Foundation
import CoreService

struct GameConsoleRepository {
  
  private let diskDataSource: GameConsoleDataSource
  
  init(diskDataSource: GameConsoleDataSource) {
    self.diskDataSource = diskDataSource
  }
  
  func getBy(_ identifier: Identifier<GameConsole>) throws -> GameConsole {
    return try diskDataSource.getBy(identifier)
  }
  
  func getAll() throws -> [GameConsole] {
    return try diskDataSource.getAll()
  }
}
