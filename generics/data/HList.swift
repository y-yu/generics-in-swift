protocol HList {
    associatedtype Head
    associatedtype Tail: HList
}

public enum Nothing { }

class HNil: HList {
    typealias Head = Nothing
    typealias Tail = HNil
    
    init() { }

    static var hNil = HNil()
}

protocol HConsProtocol: HList { }

class HCons<Head, Tail: HList>: HConsProtocol {
    let head: Head
    let tail: Tail
    
    init(_ h: Head, _ t: Tail) {
        self.head = h
        self.tail = t
    }
}

protocol HAppend1 {
    associatedtype Right1: HList
    
    static func append(_ l1: HNil, _ l2: Right1) -> Right1
}

protocol HAppend2 {
    associatedtype Left: HList
    associatedtype Right2: HList
    associatedtype Result: HList
    
    static func append(_ l1: Left, _ l2: Right2) -> Result
}

class App6<T, A, B, C, D, E, F> {
    var underlying: Any
    
    init(_ a: A, _ b: B) {
        underlying = a
    }
}

extension App6: HAppend1 where T: HAppendConstructor, A == HNil, B: HList, C == B, D == Nothing, E: HNil {
    typealias Right1 = B
    
    static func append(_ l1: A, _ l2: B) -> B {
        return l2
    }
}

extension App6: HAppend2 where T: HAppendConstructor, A == HCons<D, E>, B: HList, C == HCons<D, F>, E: HList, F: HList {
    typealias Left = A
    typealias Right2 = B
    typealias Result = C
    
    static func append(_ l1: A, _ l2: B) -> C {
        return HCons(l1.head, App6<T, E, B, F, E.Head, E.Tail, F.Tail>.append(l1.tail, l2))
    }
}

/*
protocol HAppend {
    associatedtype Left: HList
    associatedtype Right: HList
    associatedtype Result: HList
    
    static func append(_ l1: Left, _ l2: Right) -> Result
}
*/
/*

protocol HAppendNil: HAppend where Left == HNil, Result == Right { }

protocol HAppendCons: HAppend { }
*/
 
/*
protocol HAppendCons {
    associatedtype Left: HList
    associatedtype Right: HList
    associatedtype Result: HList
    
    static func append(l1: Left, l2: Right) -> Result
}
*/
