import Foundation
import CoreService

struct Game {
  let identifier: Identifier<Game>
  let name: String
  let alternativeNames: [String]?
  let gameConsoles: [GameConsole]
  let genres: [Genre]
  let releasedOn: Date
}
