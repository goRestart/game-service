import JSON

struct GameConsoleViewModel {
  let identifier: String
  let name: String
  let alternativeName: String?
}

extension GameConsoleViewModel: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("id", identifier)
    try json.set("name", name)
    try json.set("alternative_name", alternativeName)
    return json
  }
}
