import UIKit

class Router {

    init(navigationController: UINavigationController, factory: @escaping (Route) -> UIViewController?) {
        self.navigationController = navigationController
        self.factory = factory
    }

    func perform(action: NavigationAction) {
        switch action {
        case .start:
            start()
        case let .goTo(route):
            go(to: route)
        }
    }

    // MARK: - Private

    private let navigationController: UINavigationController
    private let factory: (Route) -> UIViewController?

    private func start() {
        if let controller = factory(.login) {
            navigationController.setViewControllers([controller], animated: false)
        }
    }

    private func go(to route: Route) {
        if let controller = factory(route) {
            navigationController.pushViewController(controller, animated: true)
        }
    }

}
