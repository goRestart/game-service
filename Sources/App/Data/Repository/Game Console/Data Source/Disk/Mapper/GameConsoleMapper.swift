import CoreService

struct GameConsoleMapper: Mappable {
  func map(_ from: GameConsoleDiskModel) throws -> GameConsole {
    return GameConsole(
      identifier: Identifier(from.id!.string!),
      name: from.name,
      alternativeName: from.alterantiveName
    )
  }
}
