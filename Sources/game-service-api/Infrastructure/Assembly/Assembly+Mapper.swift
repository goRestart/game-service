import CoreService

extension Assembly {
  var gameMapper: GameMapper {
    return GameMapper(
      gameConsoleMapper: gameConsoleMapper,
      genreMapper: genreMapper
    )
  }
  
  private var genreMapper: GenreMapper {
    return GenreMapper()
  }
  
  var gameConsoleMapper: GameConsoleMapper {
    return GameConsoleMapper(
      manufacturerMapper: manufacturerMapper
    )
  }
  
  private var manufacturerMapper: ManufacturerMapper {
    return ManufacturerMapper()
  }
}
