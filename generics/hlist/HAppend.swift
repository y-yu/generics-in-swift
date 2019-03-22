protocol HAppend {
    associatedtype Left: HList
    associatedtype Right: HList
    associatedtype Result: HList
    
    static func append(_ l1: Left, _ l2: Right) -> Result
}

extension App1: HAppend where A: HList {
    typealias Left = HNil
    typealias Right = A
    typealias Result = A
    
    static func append(_ l1: HNil, _ l2: A) -> A {
        return l2
    }
}

// I use `AppWithEV` rather than `App5` so I have to write prefix `X.`
// behind `A`, `B`, `C` and `D` to access these type parameters.
extension AppWithEV: HAppend where EV.Left == X.A, X.B == EV.Right, X.C == EV.Result {
    typealias Left = HCons<X.D, X.A>
    typealias Right = X.B
    typealias Result = HCons<X.D, X.C>
    
    static func append(_ l1: HCons<X.D, X.A>, _ l2: X.B) -> HCons<X.D, X.C> {
        return HCons(l1.head, EV.append(l1.tail, l2))
    }
}

// This is a `App5` version I described in my presentation.
// If I used this version, I don't need to write prefix `X.`
// so it's more simple.
/*
extension App5: HAppend where EV.Left == A, B == EV.Right, C == EV.Result {
    typealias Left = HCons<D, A>
    typealias Right = B
    typealias Result = HCons<D, C>
    
    static func append(_ l1: HCons<D, A>, _ l2: B) -> HCons<D, C> {
        return HCons(l1.head, EV.append(l1.tail, l2))
    }
}
*/
