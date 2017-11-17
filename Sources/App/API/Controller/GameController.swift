import HTTP
import CoreService

private struct Parameter {
  static let identifier = "id"
}

struct GameController {
 
  private let gameViewMapper: GameViewMapper
  
  init(gameViewMapper: GameViewMapper) {
    self.gameViewMapper = gameViewMapper
  }
  
  func getById(with request: Request) throws -> ResponseRepresentable {
    guard let gameConsoleId = request.parameters[Parameter.identifier]?.uuid else {
      return Response.missingParameters
    }
    return ""
  }
}
