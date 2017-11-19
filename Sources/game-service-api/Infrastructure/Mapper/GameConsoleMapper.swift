import CoreService
import App
import JSON

private struct JSONKey {
  static let identifier = "id"
  static let name = "name"
  static let alternativeName = "alternative_name"
  static let manufacturer = "manufacturer"
}

struct GameConsoleMapper: Mappable {
  
  private let manufacturerMapper: ManufacturerMapper
  
  init(manufacturerMapper: ManufacturerMapper) {
    self.manufacturerMapper = manufacturerMapper
  }
  
  func map(_ from: [String: JSON]) throws -> GameConsole {
    let identifier = from[JSONKey.identifier]!.string!
    let name = from[JSONKey.name]!.string!
    let alternativeName = from[JSONKey.alternativeName]?.string
 
    let manufacturer = try manufacturerMapper.map(
      from[JSONKey.manufacturer]?.object
    )
    
    return GameConsole(
      identifier: Identifier(identifier),
      name: name,
      alternativeName: alternativeName,
      manufacturer: manufacturer
    )
  }
}
