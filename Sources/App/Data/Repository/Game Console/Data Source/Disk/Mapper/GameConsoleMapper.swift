import CoreService

struct GameConsoleMapper: Mappable {
  
  private let manufacturerMapper: ManufacturerMapper
  
  init(manufacturerMapper: ManufacturerMapper) {
    self.manufacturerMapper = manufacturerMapper
  }
  
  func map(_ from: GameConsoleDiskModel) throws -> GameConsole {
    let manufacturer = try manufacturerMapper.map(
      from.manufacturer()
    )
    return GameConsole(
      id: Identifier(from.id!.string!),
      name: from.name,
      alternativeName: from.alterantiveName,
      manufacturer: manufacturer
    )
  }
}
