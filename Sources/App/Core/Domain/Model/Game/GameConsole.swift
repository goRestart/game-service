import CoreService

public struct GameConsole {
  public let identifier: Identifier<GameConsole>
  public let name: String
  public let alternativeName: String?
  public let manufacturer: Manufacturer?
  
  public init(identifier: Identifier<GameConsole>,
              name: String,
              alternativeName: String?,
              manufacturer: Manufacturer?)
  {
    self.identifier = identifier
    self.name = name
    self.alternativeName = alternativeName
    self.manufacturer = manufacturer
  }
}
