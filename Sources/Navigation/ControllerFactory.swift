import UIKit

let makeController: (Route) -> UIViewController? =
    transition(Route.prism.login, ViewController.init)


private func transition<Value>(_ prism: Prism<Route, Value>,
                               _ factory: @escaping (Value) -> UIViewController)
                               -> (Route) -> UIViewController? {
    return { route in
        prism.tryGet(route).map { factory($0) }
    }
}
