@testable import ConferencesApp
import UIKit
import XCTest

class AppDelegateTests: XCTestCase {

    var sut: AppDelegate!

    override func setUp() {
        super.setUp()
        sut = AppDelegate()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testThatWindowShouldHaveCorrectSizeWhenTheAppIsLaunched() {
        _ = sut.application(.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertEqual(sut.window?.bounds, UIScreen.main.bounds)
    }

    func testThatApplicationDidFinishLaunchingShouldReturnTrue() {
        XCTAssertTrue(sut.application(.shared, didFinishLaunchingWithOptions: nil))
    }

}
