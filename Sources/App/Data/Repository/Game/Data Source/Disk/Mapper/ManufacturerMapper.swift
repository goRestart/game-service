import CoreService

struct ManufacturerMapper: Mappable {
  func map(_ from: ManufacturerDiskModel) throws -> Manufacturer {
    return Manufacturer(
      identifier: Identifier(from.id!.string!),
      name: from.name
    )
  }
}
