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

protocol HConsProtocol: HList { }

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

/*
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
*/

protocol App4Protocol {
    associatedtype A: HList
    associatedtype B: HList
    associatedtype C: HList
    associatedtype D
}

protocol App1Protocol {
    associatedtype A: HList
}

class App1<A: HList>: App1Protocol {
    init() {}
}

/*
class App5<D, EV: HAppend>: App5Protocol {
    typealias A = HCons<D, EV.Left>
    typealias B = EV.Right
    typealias C = HCons<D, EV.Result>
    
    var underlying: Any
    
    init(_ a: A, _ b: B) {
        underlying = a
    }
}
*/
class App4<A: HList, B: HList, C: HList, D>: App4Protocol {
    init() {}
}

class BoxWithEV<EV: HAppend, X: App4Protocol> { }


/*
class AbstractBox<X: App4Protocol> {
    init() {}
}

class Box<X: App4Protocol>: AbstractBox<X> { }

class BoxWithEV<EV: HAppend, X: App4Protocol>: AbstractBox<X> { }
*/
 
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

extension BoxWithEV: HAppend where X.A == HCons<X.D, EV.Left>, X.B == EV.Right, X.C == HCons<X.D, EV.Result> {
    typealias Left = X.A
    typealias Right = X.B
    typealias Result = X.C
    
    static func append(_ l1: X.A, _ l2: X.B) -> X.C {
        return HCons(l1.head, EV.append(l1.tail, l2))
    }
}

/*
extension App6: HAppend where T == HAppendConstructor, A == HNil, B: HList, C == B, D == Nothing, E == HNil, F: HList {
    typealias Right = B
    typealias Left = A
    typealias Result = B
    
    func append(_ l1: A, _ l2: B) -> B {
        return l2
    }
}

extension Box where EV: HAppend & App6Protocol, X.T == HAppendConstructor, X.A: HList, X.B: HList, X.C: HList {
    typealias Left = HCons<X.D, X.A>
    typealias Right = X.B
    typealias Result = HCons<X.D, X.C>
    
    func append(_ l1: HCons<X.D, X.A>, _ l2: X.B) -> HCons<X.D, X.C> {
        print(type(of: a))
        print("====================================")
        print(type(of: self))
        
        if l1.tail is HNil {
            return underlying.append(l1.tail as! HNil, l2)
        } else {
            return HCons(l1.head, Box(underlying).append(l1.tail, l2))
        }
    }
}
*/

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
