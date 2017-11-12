import FluentProvider
import CoreService

final class GameDiskModel: Model {
  
  let storage = Storage()
  
  var name: String
  var releasedOn: Date
  
  init(name: String,
       releasedOn: Date)
  {
    self.name = name
    self.releasedOn = releasedOn
  }
  
  init(row: Row) throws {
    name = try row.get(Keys.name)
    releasedOn = try row.get(Keys.releasedOn)
  }
  
  func makeRow() throws -> Row {
    var row = Row()
    try row.set(Keys.name, name)
    try row.set(Keys.releasedOn, releasedOn)
    return row
  }
  
  // MARK: - Database keys
  
  struct Keys {
    static let name = "name"
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
      builder.text(Keys.name, unique: true)
      builder.date(Keys.releasedOn)
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}
