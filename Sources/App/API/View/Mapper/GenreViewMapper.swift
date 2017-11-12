import CoreService

struct GenreViewMapper: Mappable {
  func map(_ from: Genre) throws -> GenreViewModel {
    return GenreViewModel(
      identifier: from.identifier.value,
      name: from.name
    )
  }
}
