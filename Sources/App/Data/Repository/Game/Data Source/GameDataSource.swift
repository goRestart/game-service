import CoreService

protocol GameDataSource {
  func getBy(_ identifier: Identifier<Game>) throws -> Game
  func find(with query: SearchQuery) throws -> [Game]
}
