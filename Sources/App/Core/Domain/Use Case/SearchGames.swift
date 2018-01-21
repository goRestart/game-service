import Foundation

struct SearchGames {
  
  private let gameRepository: GameRepository
  private let gameToSearchResultMapperProvider: GameToSearchResultMapperProvider
  init(gameRepository: GameRepository,
       gameToSearchResultMapperProvider: GameToSearchResultMapperProvider)
  {
    self.gameRepository = gameRepository
    self.gameToSearchResultMapperProvider = gameToSearchResultMapperProvider
  }
  
  func execute(with query: SearchQuery) throws -> [GameSearchResult] {
    let games = try gameRepository.find(with: query)

    return try gameToSearchResultMapperProvider
      .mapper(with: query.query)
      .map(elements: games)
  }
}
