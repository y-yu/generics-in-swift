protocol Nat1 {
    associatedtype T: Constructor
    
    func apply<A>(App1<T, A>) -> App1<T, B>
}

class Nat1Constructor: Constructor { }

extension Nat1: Newtype1 {
    typealias T = Function1Constructor
}

extension App2 where T: Function1Constructor {
    func prj() -> ((A) -> B) {
        return (self.underlying as! ((A) -> B))
    }
}


