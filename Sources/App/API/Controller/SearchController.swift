import HTTP
import CoreService

private struct Parameter {
  static let query = "query"
}

struct SearchController {
  
  private let searchGames: SearchGames
 
  init(searchGames: SearchGames) {
    self.searchGames = searchGames
  }
  
  func find(with request: Request) throws -> ResponseRepresentable {
    guard let query = request.data[Parameter.query]?.string, !query.trim().isEmpty else {
      return Response.missingParameters
    }
    let searchQuery = SearchQuery(
      query: query
    )
    return try searchGames
      .execute(with: searchQuery)
      .makeResponse()
  }
}
