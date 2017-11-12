import CoreService

// MARK: - Game

extension Assembly {
  // MARK: - Domain
  
  var gameMapper: GameMapper {
    return GameMapper(
      manufacturerMapper: manufacturerMapper,
      gameConsoleMapper: gameConsoleMapper,
      genreMapper: genreMapper
    )
  }
  
  private var manufacturerMapper: ManufacturerMapper {
    return ManufacturerMapper()
  }
  
  private var genreMapper: GenreMapper {
    return GenreMapper()
  }
}

// MARK: - Game console

extension Assembly {
  
  // MARK: - View
  
  var gameConsoleViewMapper: GameConsoleViewMapper {
    return GameConsoleViewMapper()
  }
  
  // MARK: - Domain
  
  var gameConsoleMapper: GameConsoleMapper {
    return GameConsoleMapper()
  }
}
