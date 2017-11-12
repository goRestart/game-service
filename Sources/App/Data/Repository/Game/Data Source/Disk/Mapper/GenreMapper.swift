import CoreService

struct GenreMapper: Mappable {
  func map(_ from: GenreDiskModel) throws -> Genre {
    return Genre(
      identifier: Identifier(from.id!.string!),
      name: from.name
    )
  }
}
