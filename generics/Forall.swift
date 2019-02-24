/*
class Forall<A> { }

protocol Forall0 {
    associatedtype T: Constructor
    
    func apply() -> App0<T>
}

protocol Forall1 {
    associatedtype T: Constructor
    
    func apply<A>(_ a: A) -> App1<T, A>
}

protocol Forall1Cons {
    associatedtype T: Constructor
    
    func forallCons<A>(_ a: A) -> App2<T, A, Self>
}

protocol Exists1Cons {
    associatedtype T: Constructor
    associatedtype X
    
    func existsCons(_ a: X) -> App2<T, X, Self>
}

extension HCons: Forall1Cons {
    func forallCons<A>(_ a: A) -> App2<HConsConstructor, A, HCons<H, L>> {
        return HCons<A, HCons<H, L>>(a, self).inj()
    }
}

*/
