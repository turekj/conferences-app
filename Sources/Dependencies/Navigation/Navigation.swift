import UIKit

struct Navigation {
    var controller = UINavigationController()
    var factory: (Route) -> UIViewController? =
        transition(Route.prism.login, ViewController.init)

    func perform(action: NavigationAction) {
        switch action {
        case .start:
            start()
        case let .goTo(route):
            go(to: route)
        }
    }

    private func start() {
        if let controller = factory(.login) {
            self.controller.setViewControllers([controller], animated: false)
        }
    }

    private func go(to route: Route) {
        if let controller = factory(route) {
            self.controller.pushViewController(controller, animated: true)
        }
    }
}

enum NavigationAction {
    case start
    case goTo(route: Route)
}
