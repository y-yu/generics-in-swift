struct Not<A> {
    var value: (A) -> Never
    
    init(_ f: @escaping (A) -> Never) {
        value = f
    }
}
