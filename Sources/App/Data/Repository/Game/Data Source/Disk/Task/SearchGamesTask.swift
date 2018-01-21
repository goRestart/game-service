import CoreService

private struct Limit {
  static let maxResults = 10
}

struct SearchGamesTask {
  
  func execute(with query: SearchQuery) throws -> [GameDiskModel] {
    var queryBuilder = try GameDiskModel
      .makeQuery()
    
    queryBuilder = try queryBuilder.filter(
      GameDiskModel.Keys.name, like: query.query
    ).limit(Limit.maxResults)

    return try queryBuilder.all()
  }
}
