@testable import ConferencesApp
import UIKit
import XCTest

class OrCompositionTests: XCTestCase {

    var hello: ((String) -> String?)!
    var world: ((String) -> String?)!
    var none: ((String) -> String?)!
    var otherNone: ((String) -> String?)!

    override func setUp() {
        super.setUp()

        hello = { "Hello \($0)" }
        world = { "Is \($0) World" }
        none = { _ in nil }
        otherNone = { _ in nil }
    }

    func testOrCompositionWorksWithFirstFunctionReturningValue() {
        let sut = hello ?>> world

        let result = sut("Jacob")

        XCTAssertEqual("Hello Jacob", result)
    }

    func testOrCompositionWorksWithSecondFunctionReturningValue() {
        let sut = none ?>> world

        let result = sut("Nice")

        XCTAssertEqual("Is Nice World", result)
    }

    func testOrCompositionWorksWithNeitherFunctionReturningValue() {
        let sut = none ?>> otherNone

        let result = sut("Whatever")

        XCTAssertNil(result)
    }

}
