import HTTP

public struct GameResponse<Value, RawResponse: Response> {
  public let value: Value?
  public let raw: RawResponse
  
  init(value: Value? = nil, raw: RawResponse) {
    self.value = value
    self.raw = raw
  }
}
