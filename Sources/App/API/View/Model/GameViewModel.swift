import JSON

struct GameViewModel {
  let identifier: String
  let name: String
  let alternativeNames: [String]?
  let gameConsoles: [GameConsoleViewModel]
  let genres: [GenreViewModel]
  let releasedOn: Date
}

// MARK: - JSONRepresentable

extension GameViewModel: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("id", identifier)
    try json.set("name", name)
    try json.set("alternative_names", alternativeNames)
    try json.set("game_consoles", gameConsoles)
    try json.set("genres", genres)
    try json.set("released_on", releasedOn)
    return json
  }
}
