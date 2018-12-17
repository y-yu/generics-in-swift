protocol Exists {
    associatedtype T: Constructor
    associatedtype A
    
    func apply(_ a: A) -> App1<T, A>
}
