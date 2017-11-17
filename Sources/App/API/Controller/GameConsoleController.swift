import HTTP
import CoreService

private struct Parameter {
  static let identifier = "id"
}

struct GameConsoleController {
  
  private let getAllGameConsoles: GetAllGameConsoles
  private let getGameConsoleById: GetGameConsoleById
  private let gameConsoleViewMapper: GameConsoleViewMapper
  
  init(getAllGameConsoles: GetAllGameConsoles,
       getGameConsoleById: GetGameConsoleById,
       gameConsoleViewMapper: GameConsoleViewMapper)
  {
    self.getAllGameConsoles = getAllGameConsoles
    self.getGameConsoleById = getGameConsoleById
    self.gameConsoleViewMapper = gameConsoleViewMapper
  }
  
  func getAll() throws -> ResponseRepresentable {
    return try gameConsoleViewMapper.map(
      elements: try getAllGameConsoles.execute()
    ).makeJSON()
  }
  
  func getById(with request: Request) throws -> ResponseRepresentable {
    guard let gameConsoleId = request.parameters[Parameter.identifier]?.uuid else {
      return Response.missingParameters
    }
    do {
      return try gameConsoleViewMapper.map(
        try getGameConsoleById.execute(
          with: Identifier(gameConsoleId.uuidString)
        )
      ).makeJSON()
    } catch GameConsoleError.notFound {
      return Response.invalidGameConsoleId
    }
  }
}
