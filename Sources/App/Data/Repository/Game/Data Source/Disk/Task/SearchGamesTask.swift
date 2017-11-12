import CoreService

struct SearchGamesTask {
  
  func execute(with query: SearchQuery) throws -> [GameDiskModel] {
    var queryBuilder = try GameDiskModel
      .makeQuery()
    
    queryBuilder = try queryBuilder.filter(
      GameDiskModel.Keys.name, .contains, query.query.lowercased()
    )
    return try queryBuilder.all()
  }
}
