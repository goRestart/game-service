import HTTP

struct GameConsoleController {
  
  private let getAllGameConsoles: GetAllGameConsoles
  private let viewMapper: GameConsoleViewMapper
  
  init(getAllGameConsoles: GetAllGameConsoles,
       viewMapper: GameConsoleViewMapper)
  {
    self.getAllGameConsoles = getAllGameConsoles
    self.viewMapper = viewMapper
  }
  
  func getAll() throws -> ResponseRepresentable {
    return try viewMapper.map(
      elements: try getAllGameConsoles.execute()
    ).makeJSON()
  }
}
