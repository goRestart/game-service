import Foundation
import CoreService

public struct Game {
  public let identifier: Identifier<Game>
  public let name: String
  public let alternativeNames: [String]?
  public let gameConsoles: [GameConsole]
  public let genres: [Genre]
  public let releasedOn: Date

  public init(identifier: Identifier<Game>,
       name: String,
       alternativeNames: [String]?,
       gameConsoles: [GameConsole],
       genres: [Genre],
       releasedOn: Date)
  {
    self.identifier = identifier
    self.name = name
    self.alternativeNames = alternativeNames
    self.gameConsoles = gameConsoles
    self.genres = genres
    self.releasedOn = releasedOn
  }
}
