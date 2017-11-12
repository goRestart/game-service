import Foundation
import CoreService

struct Game {
  let identifier: Identifier<Game>
  let name: String
  let alternativeNames: [String]?
  let manufacturer: Manufacturer?
  let gameConsoles: [GameConsole]
  let genres: [Genre]
  let releasedOn: Date
}
