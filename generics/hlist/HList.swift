protocol HList {
    associatedtype Head
    associatedtype Tail: HList
}

public enum Nothing { }
struct HNil: HList {
    typealias Head = Nothing
    typealias Tail = HNil
    
    init() { }

    static var hNil = HNil()
}

struct HCons<H, T: HList>: HList {
    typealias Head = H
    typealias Tail = T
    
    let head: Head
    let tail: Tail
    
    init(_ h: Head, _ t: Tail) {
        self.head = h
        self.tail = t
    }
}
