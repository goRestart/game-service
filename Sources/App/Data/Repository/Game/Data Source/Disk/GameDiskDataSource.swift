import CoreService

struct GameDiskDataSource: GameDataSource {

  private let getGameByIdTask: GetGameByIdTask
  private let searchGamesTask: SearchGamesTask
  private let gameMapper: GameMapper
  
  init(getGameByIdTask: GetGameByIdTask,
       searchGamesTask: SearchGamesTask,
       gameMapper: GameMapper)
  {
    self.getGameByIdTask = getGameByIdTask
    self.searchGamesTask = searchGamesTask
    self.gameMapper = gameMapper
  }

  func getBy(_ identifier: Identifier<Game>) throws -> Game {
    return try gameMapper.map(
      try getGameByIdTask.execute(with: identifier)
    )
  }
  
  func find(with query: SearchQuery) throws -> [Game] {
    return try gameMapper.map(
      elements: try searchGamesTask.execute(with: query)
    )
  }
}
