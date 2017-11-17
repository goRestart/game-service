import CoreService

struct GetGameById {
  
  private let gameRepository: GameRepository
  
  init(gameRepository: GameRepository) {
    self.gameRepository = gameRepository
  }
  
  func execute(with identifier: Identifier<Game>) throws -> Game {
    return try gameRepository.getBy(identifier)
  }
}
