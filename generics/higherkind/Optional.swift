class OptionalConstructor: Constructor { }

/*
extension Optional: Newtype1 {
    typealias T = OptionalConstructor
    typealias X = Wrapped
}

extension App1 where T: OptionalConstructor {
    func prj() -> Optional<A> {
        return (self.underlying as? A)
    }
}
*/
