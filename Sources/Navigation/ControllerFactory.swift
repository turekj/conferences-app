import UIKit

func transition<Value>(_ prism: Prism<Route, Value>,
                       _ factory: @escaping (Value) -> UIViewController) -> (Route) -> UIViewController? {
    return { route in
        prism.tryGet(route).map { factory($0) }
    }
}

infix operator ?>>: OrForwardComposition

precedencegroup OrForwardComposition {
    associativity: left
    higherThan: AssignmentPrecedence
}

func ?>><A, B>(_ a: @escaping (A) -> B?, _ b: @escaping (A) -> B?) -> (A) -> B? {
    return { a($0) ?? b($0) }
}
