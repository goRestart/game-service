import CoreService

struct GameConsoleViewMapper: Mappable {
  
  func map(_ from: GameConsole) throws -> GameConsoleViewModel {
    return GameConsoleViewModel(
      identifier: from.identifier.value,
      name: from.name,
      alternativeName: from.alternativeName
    )
  }
}
