import CoreService
import App
import JSON

private struct JSONKey {
  static let identifier = "id"
  static let name = "name"
}

struct GenreMapper: Mappable {
  
  func map(_ from: [String: JSON]) throws -> Genre {
    let identifier = from[JSONKey.identifier]!.string!
    let name = from[JSONKey.name]!.string!
    return Genre(
      identifier: Identifier(identifier),
      name: name
    )
  }
}
