import CoreService
@testable import App

func givenGameConsole(named: String = "Need for speed") throws -> Identifier<GameConsole> {
  
  let gameConsole = GameConsoleDiskModel(
    name: named,
    alternativeName: nil,
    manufacturerId: nil
  )
  try gameConsole.save()
 
  return Identifier(
    try gameConsole.assertExists().string!
  )
}
