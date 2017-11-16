import HTTP
import CoreService

private struct Parameter {
  static let identifier = "id"
}

struct GameConsoleController {
  
  private let getAllGameConsoles: GetAllGameConsoles
  private let getGameConsoleById: GetGameConsoleById
  private let viewMapper: GameConsoleViewMapper
  
  init(getAllGameConsoles: GetAllGameConsoles,
       getGameConsoleById: GetGameConsoleById,
       viewMapper: GameConsoleViewMapper)
  {
    self.getAllGameConsoles = getAllGameConsoles
    self.getGameConsoleById = getGameConsoleById
    self.viewMapper = viewMapper
  }
  
  func getAll() throws -> ResponseRepresentable {
    return try viewMapper.map(
      elements: try getAllGameConsoles.execute()
    ).makeJSON()
  }
  
  func getById(_ request: Request) throws -> ResponseRepresentable {
    guard let gameConsoleId = request.parameters[Parameter.identifier]?.uuid else {
      return Response.missingParameters
    }
    do {
      return try viewMapper.map(
        try getGameConsoleById.execute(
          with: Identifier(gameConsoleId.uuidString)
        )
      ).makeJSON()
    } catch GameConsoleError.notFound {
      return Response.invalidGameConsoleId
    }
  }
}
