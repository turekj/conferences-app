import UIKit

struct Navigation {
    var controller = UINavigationController()
    var factory: (Route) -> UIViewController? =
        transition(Route.prism.login, ViewController.init)

    func perform(action: NavigationAction) {
        let router = Router(navigationController: controller, factory: factory)
        router.perform(action: action)
    }
}
