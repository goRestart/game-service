import HTTP
import CoreService

private struct Parameter {
  static let identifier = "id"
}

struct GameConsoleController {
  
  private let getAllGameConsoles: GetAllGameConsoles
  private let viewMapper: GameConsoleViewMapper
  
  init(getAllGameConsoles: GetAllGameConsoles,
       viewMapper: GameConsoleViewMapper)
  {
    self.getAllGameConsoles = getAllGameConsoles
    self.viewMapper = viewMapper
  }
  
  func getById(_ request: Request) throws -> ResponseRepresentable {
    guard let gameConsoleId = request.parameters[Parameter.identifier]?.string else {
      return Response.missingParameters
    }
    return "ok \(gameConsoleId)"
  }
  
  func getAll() throws -> ResponseRepresentable {
    return try viewMapper.map(
      elements: try getAllGameConsoles.execute()
    ).makeJSON()
  }
}
