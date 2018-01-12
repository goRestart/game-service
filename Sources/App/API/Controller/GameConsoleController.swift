import HTTP
import CoreService

private struct Parameter {
  static let identifier = "id"
}

struct GameConsoleController {
  
  private let getAllGameConsoles: GetAllGameConsoles
  private let getGameConsoleById: GetGameConsoleById
 
  init(getAllGameConsoles: GetAllGameConsoles,
       getGameConsoleById: GetGameConsoleById)
  {
    self.getAllGameConsoles = getAllGameConsoles
    self.getGameConsoleById = getGameConsoleById
  }
  
  func getAll() throws -> ResponseRepresentable {
    return try getAllGameConsoles.execute().makeResponse()
  }
  
  func getById(with request: Request) throws -> ResponseRepresentable {
    guard let gameConsoleId = request.parameters[Parameter.identifier]?.uuid else {
      return Response.missingParameters
    }
    do {
      return try getGameConsoleById.execute(
        with: Identifier(gameConsoleId.uuidString)
      ).makeResponse()
    } catch GameConsoleError.notFound {
      return Response.invalidGameConsoleId
    }
  }
}
