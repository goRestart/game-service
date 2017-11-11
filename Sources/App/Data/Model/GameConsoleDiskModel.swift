import FluentProvider

final class GameConsoleDiskModel: Model {
  
  let storage = Storage()
  
  var name: String
  var alterantiveName: String?
  
  init(name: String, alternativeName: String?) {
    self.name = name
    self.alterantiveName = alternativeName
  }
  
  init(row: Row) throws {
    name = try row.get(Keys.name)
    alterantiveName = try row.get(Keys.alternativeName)
  }
  
  func makeRow() throws -> Row {
    var row = Row()
    try row.set(Keys.name, name)
    try row.set(Keys.alternativeName, alterantiveName)
    return row
  }
  
  // MARK: - Database keys
  
  struct Keys {
    static let name = "name"
    static let alternativeName = "alternative_name"
  }
}

// MARK: - Customizations

extension GameConsoleDiskModel: Timestampable {
  static let name = "game_console"
  static let entity = "game_consoles"
}

// MARK: - Preparations

extension GameConsoleDiskModel: Preparation {
  static func prepare(_ database: Database) throws {
    try database.create(GameConsoleDiskModel.self) { builder in
      builder.id()
      builder.string(Keys.name, unique: true)
      builder.string(Keys.alternativeName, optional: true, unique: true)
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}
