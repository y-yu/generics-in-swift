public protocol HList { }
public struct HNil: HList {
    init() { }
}

public struct HCons<H, L: HList>: HList {
    public let head: H
    public let tail: L
    
    public init(_ h: H, _ t: L) {
        self.head = h
        self.tail = t
    }
}

class HNilConstructor: Constructor { }
class HConsConstructor: Constructor { }

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

protocol HAppend {
    associatedtype A: HList
    associatedtype B: HList
    associatedtype C: HList
    
    func append(l1: A, l2: B) -> C
}

extension 
