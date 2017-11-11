import Foundation

struct GameConsoleRepository {
  
  private let diskDataSource: GameConsoleDataSource
  
  init(diskDataSource: GameConsoleDataSource) {
    self.diskDataSource = diskDataSource
  }
  
  func getAll() throws -> [GameConsole] {
    return try diskDataSource.getAll()
  }
}
