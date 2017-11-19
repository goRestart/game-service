import CoreService
import App
import JSON

private struct JSONKey {
  static let identifier = "id"
  static let name = "name"
}

struct ManufacturerMapper: Mappable {
  
  func map(_ from: [String: JSON]) throws -> Manufacturer {
    let identifier = from[JSONKey.identifier]!.string!
    let name = from[JSONKey.name]!.string!
    return Manufacturer(
      identifier: Identifier(identifier),
      name: name
    )
  }
}
