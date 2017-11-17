import HTTP
import CoreService

private struct Parameter {
  static let identifier = "id"
}

struct GameController {
 
  private let getGameById: GetGameById
  private let gameViewMapper: GameViewMapper
  
  init(getGameById: GetGameById,
       gameViewMapper: GameViewMapper)
  {
    self.getGameById = getGameById
    self.gameViewMapper = gameViewMapper
  }
  
  func getById(with request: Request) throws -> ResponseRepresentable {
    guard let gameId = request.parameters[Parameter.identifier]?.uuid else {
      return Response.missingParameters
    }
    do {
      return try gameViewMapper.map(
        try getGameById.execute(
          with: Identifier(gameId.uuidString)
        )
      ).makeJSON()
    } catch GameError.notFound {
      return Response.invalidGameConsoleId
    }
  }
}
