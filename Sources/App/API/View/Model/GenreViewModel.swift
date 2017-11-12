import JSON

struct GenreViewModel {
  let identifier: String
  let name: String
}

// MARK: - JSONRepresentable

extension GenreViewModel: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("id", identifier)
    try json.set("name", name)
    return json
  }
}
