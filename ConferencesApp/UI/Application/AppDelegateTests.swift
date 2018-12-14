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

    func testThatWindowIsSet() {
        _ = sut.application(.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertNotNil(sut.window)
    }

    func testThatWindowShouldHaveCorrectSizeWhenAppIsLaunched() {
        _ = sut.application(.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertEqual(sut.window?.bounds, UIScreen.main.bounds)
    }

    func testThatApplicationDidFinishLaunchingShouldReturnTrue() {
        XCTAssertTrue(sut.application(.shared, didFinishLaunchingWithOptions: nil))
    }

    func testThatWindowIsKey() {
        _ = sut.application(.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(sut.window!.isKeyWindow)
    }

    func testThatViewControllerIsPushedOntoStackWhenAppIsLaunched() {
        _ = sut.application(.shared, didFinishLaunchingWithOptions: nil)
        let navigationController = sut.window?.rootViewController as? UINavigationController

        XCTAssertNotNil(navigationController)
        XCTAssertEqual(1, navigationController?.viewControllers.count)
        XCTAssertNotNil(navigationController?.viewControllers.first as? ViewController)
    }

}
