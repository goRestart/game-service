struct GameRepository {
  
  private let diskDataSource: GameDataSource
  
  init(diskDataSource: GameDataSource) {
    self.diskDataSource = diskDataSource
  }
  
  func find(with query: SearchQuery) throws -> [Game] {
    return try diskDataSource.find(with: query)
  }
}
