@testable import ConferencesApp
import UIKit
import XCTest

class CompositionTests: XCTestCase {

    func testCompositionWorksForObjects() {
        let text: (UILabel) -> Void = { $0.text = "Hello" }
        let numberOfLines: (UILabel) -> Void = { $0.numberOfLines = 22 }
        let composed = text <> numberOfLines
        let label = UILabel(frame: .zero)

        composed(label)

        XCTAssertEqual("Hello", label.text)
        XCTAssertEqual(22, label.numberOfLines)
    }

}
