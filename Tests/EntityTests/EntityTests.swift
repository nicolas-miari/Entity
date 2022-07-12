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
}

