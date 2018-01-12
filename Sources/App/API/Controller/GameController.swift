import HTTP
import CoreService

private struct Parameter {
  static let identifier = "id"
}

struct GameController {
 
  private let getGameById: GetGameById

  init(getGameById: GetGameById) {
    self.getGameById = getGameById
  }
  
  func getById(with request: Request) throws -> ResponseRepresentable {
    guard let gameId = request.parameters[Parameter.identifier]?.uuid else {
      return Response.missingParameters
    }
    do {
      return try getGameById.execute(
        with: Identifier(gameId.uuidString)
      ).makeResponse()
    } catch GameError.notFound {
      return Response.invalidGameId
    }
  }
}
