struct Prism<Root, Value> {
    let tryGet: (Root) -> Value?
    let inject: (Value) -> Root
}
