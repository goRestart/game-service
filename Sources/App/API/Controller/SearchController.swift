import HTTP
import CoreService

private struct Parameter {
  static let query = "query"
}

struct SearchController {
  
  private let searchGames: SearchGames
  private let gameViewMapper: GameViewMapper
  
  init(searchGames: SearchGames,
       gameViewMapper: GameViewMapper)
  {
    self.searchGames = searchGames
    self.gameViewMapper = gameViewMapper
  }
  
  func find(with request: Request) throws -> ResponseRepresentable {
    guard let query = request.data[Parameter.query]?.string, !query.trim().isEmpty else {
      return Response.missingParameters
    }
    let searchQuery = SearchQuery(
      query: query
    )
    return try gameViewMapper.map(
      elements: try searchGames.execute(with: searchQuery)
    ).makeJSON()
  }
}
