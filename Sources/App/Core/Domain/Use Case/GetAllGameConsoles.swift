import Foundation

struct GetGameConsoles {
  
  private let gameConsoleRepository: GameConsoleRepository
  
  init(gameConsoleRepository: GameConsoleRepository) {
    self.gameConsoleRepository = gameConsoleRepository
  }
  
  func execute() throws -> [GameConsole] {
    return try gameConsoleRepository.getAll()
  }
}
