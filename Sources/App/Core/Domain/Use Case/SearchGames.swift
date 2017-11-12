import Foundation

struct SearchGames {
  
  private let gameRepository: GameRepository
  
  init(gameRepository: GameRepository) {
    self.gameRepository = gameRepository
  }
  
  func execute(with query: SearchQuery) throws -> [Game] {
    return try gameRepository.find(with: query)
  }
}
