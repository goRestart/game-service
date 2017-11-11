import CoreService

extension Assembly {
  var getAllGameConsoles: GetAllGameConsoles {
    return GetAllGameConsoles(
      gameConsoleRepository: gameConsoleRepository
    )
  }
}
