import CoreService

struct GameRepository {
  
  private let diskDataSource: GameDataSource
  
  init(diskDataSource: GameDataSource) {
    self.diskDataSource = diskDataSource
  }
  
  func getBy(_ identifier: Identifier<Game>) throws -> Game {
    return try diskDataSource.getBy(identifier)
  }
  
  func find(with query: SearchQuery) throws -> [Game] {
    return try diskDataSource.find(with: query)
  }
}
