@testable import ConferencesApp
import XCTest

class EnvironmentTests: XCTestCase {

    func testThatEnvironmentIsASingleton() {
        XCTAssertTrue(Environment.shared === Environment.shared)
    }

}
