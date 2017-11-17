import Fluent
import CoreService

struct GetGameByIdTask {
  
  func execute(with identifier: CoreService.Identifier<Game>) throws -> GameDiskModel {
    guard let game = try GameDiskModel.find(identifier.value) else {
      throw GameError.notFound
    }
    return game
  }
}
