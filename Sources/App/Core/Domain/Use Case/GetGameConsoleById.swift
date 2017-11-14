import CoreService

struct GetGameConsoleById {
  
  private let gameConsoleRepository: GameConsoleRepository
  
  init(gameConsoleRepository: GameConsoleRepository) {
    self.gameConsoleRepository = gameConsoleRepository
  }
  
  func execute(with identifier: Identifier<GameConsole>) throws -> GameConsole {
    return try gameConsoleRepository.getBy(identifier)
  }
}
