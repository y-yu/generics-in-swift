class HNilConstructor: Constructor { }
class HConsConstructor: Constructor { }

class HAppendConstructor: Constructor {}

extension HNil: Newtype0 {
    typealias T = HNilConstructor
}

extension HCons: Newtype2 {
    typealias T = HConsConstructor
    typealias A = H
    typealias B = L
}

extension App0 where T: HNilConstructor {
    func prj() -> HNil {
        return HNil()
    }
}

extension App2 where T: HConsConstructor, B: HList {
    func prj() -> HCons<A, B> {
        return (self.underlying as! HCons<A, B>)
    }
}

extension App3: HAppend where T == HAppendConstructor, A == HNil, B: HList, B == C {
    typealias Left = A
    typealias Right = B
    typealias Result = C
    
    func append(_ l1: HNil, _ l2: B) -> C {
        return l2
    }
}
 

extension App3 : HAppend where T == HAppendConstructor, A: HList, B: HList, C: HList {
    
    
    typealias X = Any
    typealias Left = HCons<X, A>
    typealias Right = B
    typealias Result = HCons<X, C>
    
    static func append(_ l1: HCons<X, A>, _ l2: B) -> HCons<X, C> {
        return HCons(l1.head, App3<T, A, B, C>.append(l1.tail, l2))
    }
}

