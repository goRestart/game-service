import Foundation

struct GameDiskDataSource: GameDataSource {
  
  private let searchGamesTask: SearchGamesTask
  private let gameMapper: GameMapper
  
  init(searchGamesTask: SearchGamesTask,
       gameMapper: GameMapper)
  {
    self.searchGamesTask = searchGamesTask
    self.gameMapper = gameMapper
  }
  
  func find(with query: SearchQuery) throws -> [Game] {
    return try gameMapper.map(
      elements: try searchGamesTask.execute(with: query)
    )
  }
}
