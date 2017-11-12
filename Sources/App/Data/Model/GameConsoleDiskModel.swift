import FluentProvider

final class GameConsoleDiskModel: Model {
  
  let storage = Storage()
  
  var name: String
  var alterantiveName: String?
  var manufacturerId: Identifier?
  
  init(name: String,
       alternativeName: String?,
       manufacturerId: Identifier?)
  {
    self.name = name
    self.alterantiveName = alternativeName
    self.manufacturerId = manufacturerId
  }
  
  init(row: Row) throws {
    name = try row.get(Keys.name)
    alterantiveName = try row.get(Keys.alternativeName)
    manufacturerId = try row.get(Keys.manufacturerId)
  }
  
  func makeRow() throws -> Row {
    var row = Row()
    try row.set(Keys.name, name)
    try row.set(Keys.alternativeName, alterantiveName)
    try row.set(Keys.manufacturerId, manufacturerId)
    return row
  }
  
  // MARK: - Database keys
  
  struct Keys {
    static let name = "name"
    static let alternativeName = "alternative_name"
    static let manufacturerId = "manufacturer_id"
  }
}

// MARK: - Customizations

extension GameConsoleDiskModel: Timestampable {
  static let name = "game_console"
  static let entity = "game_consoles"
}

// MARK: - Relations

extension GameConsoleDiskModel {
  func manufacturer() throws -> ManufacturerDiskModel? {
    return try parent(id: manufacturerId).get()
  }
}

// MARK: - Preparations

extension GameConsoleDiskModel: Preparation {
  static func prepare(_ database: Database) throws {
    try database.create(GameConsoleDiskModel.self) { builder in
      builder.id()
      builder.string(Keys.name, unique: true)
      builder.string(Keys.alternativeName, optional: true, unique: true)
      builder.parent(ManufacturerDiskModel.self, optional: true, foreignIdKey: Keys.manufacturerId)
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}
