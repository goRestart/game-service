import FluentProvider

final class GameDiskModel: Model {
  
  let storage = Storage()
  
  var name: String
  var manufacturerId: Identifier?
  var releasedOn: Date
  
  init(name: String,
       manufacturerId: Identifier?,
       releasedOn: Date)
  {
    self.name = name
    self.manufacturerId = manufacturerId
    self.releasedOn = releasedOn
  }
  
  init(row: Row) throws {
    name = try row.get(Keys.name)
    manufacturerId = try row.get(Keys.manufacturerId)
    releasedOn = try row.get(Keys.releasedOn)
  }
  
  func makeRow() throws -> Row {
    var row = Row()
    try row.set(Keys.name, name)
    try row.set(Keys.manufacturerId, manufacturerId)
    try row.set(Keys.releasedOn, releasedOn)
    return row
  }
  
  // MARK: - Database keys
  
  struct Keys {
    static let name = "name"
    static let manufacturerId = "manufacturer_id"
    static let releasedOn = "released_on"
  }
}

// MARK: - Customizations

extension GameDiskModel: Timestampable {
  static let name = "game"
  static let entity = "games"
}

// MARK: - Relations

extension GameDiskModel {
  func manufacturer() throws -> ManufacturerDiskModel? {
    return try parent(id: manufacturerId).get()
  }
  
  var alternativeNames: Siblings<GameDiskModel, AlternativeNameDiskModel, Pivot<GameDiskModel, AlternativeNameDiskModel>> {
    return siblings()
  }
  
  var gameConsoles: Siblings<GameDiskModel, GameConsoleDiskModel, Pivot<GameDiskModel, GameConsoleDiskModel>> {
    return siblings()
  }
  
  var genres: Siblings<GameDiskModel, GenreDiskModel, Pivot<GameDiskModel, GenreDiskModel>> {
    return siblings()
  }
}

// MARK: - Preparations

extension GameDiskModel: Preparation {
  static func prepare(_ database: Database) throws {
    try database.create(GameDiskModel.self) { builder in
      builder.id()
      builder.string(Keys.name, unique: true)
      builder.parent(ManufacturerDiskModel.self, optional: true, foreignIdKey: Keys.manufacturerId)
      builder.date(Keys.releasedOn)
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}
