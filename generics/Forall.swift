protocol Forall1 {
    associatedtype T: Constructor
    
    func apply<A>(_ a: A) -> App1<T, A>
}
