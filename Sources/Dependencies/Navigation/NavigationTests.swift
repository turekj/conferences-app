@testable import ConferencesApp
import UIKit
import XCTest

protocol RoutableController {
    var route: Route { get }
}

class RoutableControllerStub: UIViewController, RoutableController {

    var stubbedRoute: Route!

    // MARK: - RoutableController

    var route: Route {
        return stubbedRoute
    }

}

class NavigationTests: XCTestCase {

    var navigationControllerSpy: NavigationControllerSpy!
    var routableControllerStub: RoutableControllerStub!
    var sut: Navigation!

    override func setUp() {
        super.setUp()

        navigationControllerSpy = NavigationControllerSpy()
        routableControllerStub = RoutableControllerStub()

        sut = Navigation()

        sut.controller = navigationControllerSpy
    }

    override func tearDown() {
        super.tearDown()

        navigationControllerSpy = nil
        routableControllerStub = nil
        sut = nil
    }

    func testThatStartActionSetsLoginController() {
        sut.perform(action: .start)

        XCTAssertNotNil(navigationControllerSpy.invokedSetViewControllers)
        XCTAssertEqual(1, navigationControllerSpy.invokedSetViewControllers?.viewControllers.count)
        XCTAssertEqual(false, navigationControllerSpy.invokedSetViewControllers?.animated)
        XCTAssertNotNil(navigationControllerSpy.invokedSetViewControllers?.viewControllers.first as? ViewController)
    }

    func testThatGoToRouteActionPushesRoutableController() {
        sut.factory = sut.factory
            ?>> transition(Route.prism.signUp) { [routableControllerStub] in routableControllerStub! }

        sut.perform(action: .goTo(route: .signUp))

        XCTAssertNotNil(navigationControllerSpy.invokedPushViewController)
        XCTAssertTrue(routableControllerStub === navigationControllerSpy.invokedPushViewController?.viewController)
        XCTAssertTrue(navigationControllerSpy.invokedPushViewController!.animated)
    }

}
