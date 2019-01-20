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

protocol HAppend {
    associatedtype Left: HList
    associatedtype Right: HList
    associatedtype Result: HList
    
    static func append(_ l1: Left, _ l2: Right) -> Result
}

/*
protocol HAppendCons {
    associatedtype Left: HList
    associatedtype Right: HList
    associatedtype Result: HList
    
    static func append(l1: Left, l2: Right) -> Result
}
*/
