import Foundation
import Identifier

public struct EntityIdentifier: Identifier, Codable {

  // The entity identifier is just a wrapper around UUID, but that is an implementation detail (the
  // abstraction allows us to change this in the future).
  private var contents: UUID

  public init() {
    contents = UUID()
  }

  // MARK: - Codable

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let value = try container.decode(String.self)
    guard let uuid = UUID(uuidString: value) else {
      let context = EncodingError.Context(codingPath: [], debugDescription: "Cannot create UUID from string \"\(value)\"")
      throw EncodingError.invalidValue(value, context)
    }
    self.contents = uuid
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(contents.uuidString)
  }
}
