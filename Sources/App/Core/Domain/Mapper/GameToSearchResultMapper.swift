import CoreService

protocol GameToSearchResultMapperProvider {
  func mapper(with query: String) -> GameToSearchResultMapper
}

struct GameToSearchResultMapper: Mappable {

  private let query: String

  init(query: String) {
    self.query = query
  }

  func map(_ from: Game) throws -> GameSearchResult {
    return GameSearchResult(
      id: from.id,
      value: from.name,
      query: query
    )
  }
}
