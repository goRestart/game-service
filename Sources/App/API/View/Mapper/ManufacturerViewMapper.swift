import CoreService

struct ManufacturerViewMapper: Mappable {
  func map(_ from: Manufacturer) throws -> ManufacturerViewModel {
    return ManufacturerViewModel(
      identifier: from.identifier.value,
      name: from.name
    )
  }
}
