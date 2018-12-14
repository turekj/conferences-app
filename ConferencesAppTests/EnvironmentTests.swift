@testable import ConferencesApp
import UIKit
import XCTest

class EnvironmentTests: XCTestCase {

    var sut: Environment!

    override func setUp() {
        super.setUp()
        sut = Environment.shared
    }

    func testThatEnvironmentIsASingleton() {
        XCTAssertTrue(Environment.shared === Environment.shared)
    }

    func testThatEnvironmentStoresRootNavigationController() {
        let delegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate
        XCTAssertTrue(delegate.window?.rootViewController === sut.navigationController)
    }

}
