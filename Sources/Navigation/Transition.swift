import UIKit

func transition<Value>(_ prism: Prism<Route, Value>,
                       _ factory: @escaping (Value) -> UIViewController) -> (Route) -> UIViewController? {
    return { route in
        prism.tryGet(route).map { factory($0) }
    }
}
