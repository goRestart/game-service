import HTTP

struct GameController {
  
  private let getAllGameConsoles: GetAllGameConsoles
  private let viewMapper: GameConsoleViewMapper
  
  init(getAllGameConsoles: GetAllGameConsoles,
       viewMapper: GameConsoleViewMapper)
  {
    self.getAllGameConsoles = getAllGameConsoles
    self.viewMapper = viewMapper
  }
  
  func gameConsoleList() throws -> ResponseRepresentable {
    return try viewMapper.map(
      elements: try getAllGameConsoles.execute()
    ).makeJSON()
  }
}
