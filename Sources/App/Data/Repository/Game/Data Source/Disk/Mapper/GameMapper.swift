import CoreService

struct GameMapper: Mappable {
  
  private let manufacturerMapper: ManufacturerMapper
  private let gameConsoleMapper: GameConsoleMapper
  private let genreMapper: GenreMapper
  
  init(manufacturerMapper: ManufacturerMapper,
       gameConsoleMapper: GameConsoleMapper,
       genreMapper: GenreMapper)
  {
    self.manufacturerMapper = manufacturerMapper
    self.gameConsoleMapper = gameConsoleMapper
    self.genreMapper = genreMapper
  }
  
  func map(_ from: GameDiskModel) throws -> Game {
    let alternativeNames = try from.alternativeNames.all().map { $0.name }
    let manufacturer = try manufacturerMapper.map(
      from.manufacturer()
    )
    let gameConsoles = try gameConsoleMapper.map(
      elements: try from.gameConsoles.all()
    )
    let genres = try genreMapper.map(
      elements: try from.genres.all()
    )
    return Game(
      identifier: Identifier(from.id!.string!),
      name: from.name,
      alternativeNames: alternativeNames,
      manufacturer: manufacturer,
      gameConsoles: gameConsoles,
      genres: genres,
      releasedOn: from.releasedOn
    )
  }
}
