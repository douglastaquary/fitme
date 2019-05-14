import XCTest
@testable import fitme

final class fitmeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(fitme().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
