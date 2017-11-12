import CoreService

struct GameViewMapper: Mappable {
  
  private let manufacturerViewMapper: ManufacturerViewMapper
  private let gameConsoleViewMapper: GameConsoleViewMapper
  private let genreViewMapper: GenreViewMapper
  
  init(manufacturerViewMapper: ManufacturerViewMapper,
       gameConsoleViewMapper: GameConsoleViewMapper,
       genreViewMapper: GenreViewMapper)
  {
    self.manufacturerViewMapper = manufacturerViewMapper
    self.gameConsoleViewMapper = gameConsoleViewMapper
    self.genreViewMapper = genreViewMapper
  }
  
  func map(_ from: Game) throws -> GameViewModel {
    let manufacturer = try manufacturerViewMapper.map(
      from.manufacturer
    )
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
      manufacturer: manufacturer,
      gameConsoles: gameConsoles,
      genres: genres,
      releasedOn: from.releasedOn
    )
  }
}
