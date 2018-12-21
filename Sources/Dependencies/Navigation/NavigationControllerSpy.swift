import UIKit

class NavigationControllerSpy: UINavigationController {

    private(set) var invokedSetViewControllers: (viewControllers: [UIViewController], animated: Bool)?
    private(set) var invokedPushViewController: (viewController: UIViewController, animated: Bool)?

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        capturedViewControllers = viewControllers
        invokedSetViewControllers = (viewControllers: viewControllers, animated: animated)
    }

    override var viewControllers: [UIViewController] {
        get { return capturedViewControllers }
        set { capturedViewControllers = newValue }
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        invokedPushViewController = (viewController: viewController, animated: animated)
    }

    // MARK: - Private

    private var capturedViewControllers: [UIViewController] = []

}
