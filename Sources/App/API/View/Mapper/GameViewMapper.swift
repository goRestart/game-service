import CoreService

struct GameViewMapper: Mappable {
  
  private let gameConsoleViewMapper: GameConsoleViewMapper
  private let genreViewMapper: GenreViewMapper
  
  init(gameConsoleViewMapper: GameConsoleViewMapper,
       genreViewMapper: GenreViewMapper)
  {
    self.gameConsoleViewMapper = gameConsoleViewMapper
    self.genreViewMapper = genreViewMapper
  }
  
  func map(_ from: Game) throws -> GameViewModel {
    let gameConsoles = try gameConsoleViewMapper.map(
      elements: from.gameConsoles
    )
    let genres = try genreViewMapper.map(
      elements: from.genres
    )
    return GameViewModel(
      identifier: from.identifier.value,
      name: from.name,
      alternativeNames: from.alternativeNames,
      gameConsoles: gameConsoles,
      genres: genres,
      releasedOn: from.releasedOn
    )
  }
}
