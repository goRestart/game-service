import Foundation
import CoreService
@testable import App

func givenGame(named: String = "Need for speed") throws -> Identifier<GameConsole> {
  let game = GameDiskModel(
    name: named,
    releasedOn: Date()
  )
  try game.save()
  
  return Identifier(
    try game.assertExists().string!
  )
}
