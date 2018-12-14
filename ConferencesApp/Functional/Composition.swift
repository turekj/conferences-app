precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardAppliance
}

infix operator <>: ForwardComposition

func <><A: AnyObject>(_ f: @escaping (A) -> Void, _ g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}
