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
    typealias Left = HCons<X, A>
    typealias Right = B
    typealias Result = HCons<X, C>
    
    class ConcreatHAppend: HAppend {
        typealias Left = A
        typealias Right = B
        typealias Result = C
        
        static func append(l1: HCons<X, A>, l2: B) -> HCons<X, C>
    }
    
    static func append(l1: HCons<X, A>, l2: B) -> HCons<X, C> {
        let ev: HAppend<A, B, C> = HAppend()
        return HCons(l1.head, HAppend.append(l1: l1.tail, l2: l2))
    }
}

