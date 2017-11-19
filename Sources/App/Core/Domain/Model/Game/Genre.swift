import CoreService

public struct Genre {
  public let identifier: Identifier<Genre>
  public let name: String
  
  public init(identifier: Identifier<Genre>,
       name: String)
  {
    self.identifier = identifier
    self.name = name
  }
}
