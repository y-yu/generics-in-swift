protocol Newtype0 {
    associatedtype T: Constructor
    
    func inj() -> App0<T>
}

extension Newtype0 {
    func inj() -> App0<T> {
        return App0(self)
    }
}

/*
protocol Newtype1 {
    associatedtype T: Constructor
    associatedtype X
    
    func inj() -> App1<T, X>
}

extension Newtype1 {
    func inj() -> App1<T, X> {
        return App1(self)
    }
}
*/

protocol Newtype2 {
    associatedtype T: Constructor
    associatedtype X
    associatedtype Y
    
    func inj() -> App2<T, X, Y>
}

extension Newtype2 {
    func inj() -> App2<T, X, Y> {
        return App2(self)
    }
}

protocol Newtype3 {
    associatedtype T: Constructor
    associatedtype A
    associatedtype B
    associatedtype C
    
    func inj() -> App3<T, A, B, C>
}

extension Newtype3 {
    func inj() -> App3<T, A, B, C> {
        return App3(self)
    }
}
