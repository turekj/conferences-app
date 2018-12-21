infix operator ?>>: OrForwardComposition

precedencegroup OrForwardComposition {
    associativity: left
    higherThan: AssignmentPrecedence
}

func ?>><A, B>(_ a: @escaping (A) -> B?, _ b: @escaping (A) -> B?) -> (A) -> B? {
    return { a($0) ?? b($0) }
}
