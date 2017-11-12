import FluentProvider

final class GenreDiskModel: Model {
  
  let storage = Storage()
  
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  init(row: Row) throws {
    name = try row.get(Keys.name)
  }
  
  func makeRow() throws -> Row {
    var row = Row()
    try row.set(Keys.name, name)
    return row
  }
  
  // MARK: - Database keys
  
  struct Keys {
    static let name = "name"
  }
}

// MARK: - Customizations

extension GenreDiskModel: Timestampable {
  static let name = "genre"
  static let entity = "genres"
}

// MARK: - Preparations

extension GenreDiskModel: Preparation {
  static func prepare(_ database: Database) throws {
    try database.create(GenreDiskModel.self) { builder in
      builder.id()
      builder.string(Keys.name, unique: true)
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}
