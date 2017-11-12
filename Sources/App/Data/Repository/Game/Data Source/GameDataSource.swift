protocol GameDataSource {
  func find(with query: SearchQuery) throws -> [Game]
}
