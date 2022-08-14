import XCTest
import Entity

final class EntityTests: XCTestCase {

  func testCopiedInstanceIsEqual() {
    // GIVEN
    let id1 = EntityIdentifier()
    let id2 = id1

    // THEN
    XCTAssertEqual(id1, id2)
  }

  func testNewInstanceIsUniquene() {
    // GIVEN
    let id1 = EntityIdentifier()
    let id2 = EntityIdentifier()

    // THEN
    XCTAssertNotEqual(id1, id2)
  }

  func testEncodingDecodingPreservesContent() throws {
    // GIVEN
    let id = EntityIdentifier()

    // WHEN
    let data = try JSONEncoder().encode(id)
    let recovered = try JSONDecoder().decode(EntityIdentifier.self, from: data)

    // THEN
    XCTAssertEqual(id, recovered)
  }

  func testDecodeWellFormedStringSucceeds() throws {
    // GIVEN
    let string = "\"82217999-5182-4EB4-B82E-82E2F1A67860\""
    let data = string.data(using: .utf8)!

    // THEN
    XCTAssertNoThrow(try JSONDecoder().decode(EntityIdentifier.self, from: data))
  }

  func testDecodeMalformedStringFails() throws {
    // GIVEN
    let string = "\"82217999-5182-4EB4-B82E-\""
    let data = string.data(using: .utf8)!

    // THEN
    XCTAssertThrowsError(try JSONDecoder().decode(EntityIdentifier.self, from: data))
  }
}

