import CoreService

struct GenreMapper: Mappable {
  func map(_ from: GenreDiskModel) throws -> Genre {
    return Genre(
      id: Identifier(from.id!.string!),
      name: from.name
    )
  }
}
