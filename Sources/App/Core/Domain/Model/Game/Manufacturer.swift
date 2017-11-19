import CoreService

public struct Manufacturer {
  public let identifier: Identifier<Manufacturer>
  public let name: String
  
  public init(identifier: Identifier<Manufacturer>,
              name: String)
  {
    self.identifier = identifier
    self.name = name
  }
}
