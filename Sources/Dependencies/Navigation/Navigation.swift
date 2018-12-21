import UIKit

struct Navigation {
    var controller = UINavigationController()

    func perform(action: NavigationAction) {
        switch action {
        case .start:
            start()
        }
    }

    private func start() {
        if let controller = makeController(.login) {
            self.controller.setViewControllers([controller], animated: false)
        }
    }
}

enum NavigationAction {
    case start
}
