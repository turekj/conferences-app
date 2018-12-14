@testable import ConferencesApp
import UIKit
import XCTest

class ApplianceTests: XCTestCase {

    func testForwardApplianceWorksForObjects() {
        let label = UILabel(frame: .zero)
            |> { $0.text = "Hello world" }

        XCTAssertEqual("Hello world", label.text)
    }

}
