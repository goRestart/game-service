import CoreService
import App
import JSON

private struct JSONKey {
  static let identifier = "id"
  static let name = "name"
  static let alternativeNames = "alternative_names"
  static let gameConsoles = "game_consoles"
  static let genres = "genres"
  static let releasedOn = "released_on"
}

struct GameMapper: Mappable {
  
  private let gameConsoleMapper: GameConsoleMapper
  private let genreMapper: GenreMapper
  
  init(gameConsoleMapper: GameConsoleMapper,
       genreMapper: GenreMapper)
  {
    self.gameConsoleMapper = gameConsoleMapper
    self.genreMapper = genreMapper
  }
  
  func map(_ from: [String: JSON]) throws -> Game {
    let identifier = from[JSONKey.identifier]!.string!
    let name = from[JSONKey.name]!.string!

    let alternativeNames = from[JSONKey.alternativeNames]?.array?
      .array
      .flatMap { $0.string }
    
    let genres = try genreMapper.map(
      elements: from[JSONKey.genres]?.array?.array.flatMap { $0.object }
    )
    
    let gameConsoles = try gameConsoleMapper.map(
      elements: from[JSONKey.gameConsoles]?.array?.array.flatMap { $0.object }
    )
    let releasedOn = from[JSONKey.releasedOn]!.date!
    
    return Game(
      identifier: Identifier(identifier),
      name: name,
      alternativeNames: alternativeNames,
      gameConsoles: gameConsoles,
      genres: genres,
      releasedOn: releasedOn
    )
  }
}
