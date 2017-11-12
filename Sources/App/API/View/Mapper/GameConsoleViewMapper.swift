import CoreService

struct GameConsoleViewMapper: Mappable {
  
  private let manufacturerViewMapper: ManufacturerViewMapper
  
  init(manufacturerViewMapper: ManufacturerViewMapper) {
    self.manufacturerViewMapper = manufacturerViewMapper
  }
  
  func map(_ from: GameConsole) throws -> GameConsoleViewModel {
    let manufacturer = try manufacturerViewMapper.map(
      from.manufacturer
    )
    return GameConsoleViewModel(
      identifier: from.identifier.value,
      name: from.name,
      alternativeName: from.alternativeName,
      manufacturer: manufacturer
    )
  }
}
