import CoreService

struct SearchGamesTask {
  
  func execute(with query: SearchQuery) throws -> [GameDiskModel] {
    var queryBuilder = try GameDiskModel
      .makeQuery()
    
    queryBuilder = try queryBuilder.filter(
      GameDiskModel.Keys.name, like: query.query
    )
    return try queryBuilder.all()
  }
}
