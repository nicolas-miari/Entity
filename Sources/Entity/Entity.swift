import Foundation
import Identifier

public struct EntityIdentifier: Identifier {

  // The entity identifier is just a wrapper around UUID, but that is an implementation detail (the
  // abstraction allows us to change this in the future).
  private var contents: UUID

  public init() {
    contents = UUID()
  }
}
