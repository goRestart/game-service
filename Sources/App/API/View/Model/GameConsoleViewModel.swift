import JSON

struct GameConsoleViewModel {
  let identifier: String
  let name: String
  let alternativeName: String?
  let manufacturer: ManufacturerViewModel?
}

// MARK: - JSONRepresentable

extension GameConsoleViewModel: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("id", identifier)
    try json.set("name", name)
    try json.set("alternative_name", alternativeName)
    try json.set("manufacturer", manufacturer)
    return json
  }
}
