class HListConstructor: Constructor { }

class HNilConstructor: HListConstructor { }
class HConsConstructor: HListConstructor { }
 
class HAppendConstructor: Constructor {}

extension HNil: Newtype2 {
    typealias T = HNilConstructor
    typealias X = Head
    typealias Y = Tail
}

extension HCons: Newtype2 {
    typealias T = HConsConstructor
    typealias X = Head
    typealias Y = Tail
}

extension App2 where T == HNilConstructor {
    func prj() -> HNil {
        return HNil()
    }
}

extension App2 where T == HConsConstructor, B: HList {
    func prj() -> HCons<A, B> {
        return (self.underlying as! HCons<A, B>)
    }
}
/*
extension App6: HAppendNil where T == HAppendConstructor, A == HNil, B: HList, C == B, D == Nothing, E == Nothing {
    class HAppendNil: HAppend {
        typealias Left = A
        typealias Right = B
        typealias Result = C
        
        static func append(_ l1: A, _ l2: B) -> C {
            return l2
        }
    }
    
    static func hAppend(_ l1: A, _ l2: B) -> C {
        return HAppendNil.append(l1, l2)
    }
}

extension App6: HAppendCons where T == HAppendConstructor, A == HCons<D, E>, B: HList, C == HCons<D, F>, E: HConsProtocol, F: HList {
    class HAppendCons: HAppend {
        typealias Left = A
        typealias Right = B
        typealias Result = C
        
        static func append(_ l1: A, _ l2: B) -> C {
            return HCons(l1.head, App6<T, E, B, F, E.Head, E.Tail, F.Tail>.hAppend(l1.tail, l2))
        }
    }
    
    static func hAppend(_ l1: A, _ l2: B) -> C {
        return HAppendCons.append(l1, l2)
    }
}
 */
/*
extension App4 where T == HAppendConstructor, A == HNil, B: HList, C == B {
    class HAppendNil: HAppend {
        typealias Left = HNil
        typealias Right = B
        typealias Result = B
        
        static func append(_ l2: App2<HListConstructor, B.Head, B.Tail>) -> B {
            return l2.prj()
        }
    }
    
    static func hAppend(_ l2: App2<HListConstructor, B.Head, B.Tail>) -> B {
        return l2
    }
}

extension App4 where T == HAppendConstructor, A: HList, B: HList, C: HList {
    class HAppendCons: HAppend {
        typealias Left = HCons<D, A>
        typealias Right = B
        typealias Result = HCons<D, C>
        
        static func append(_ l1: HCons<D, A>, _ l2: B) -> HCons<D, C> {
            return HCons(l1.head, A.
        }
    }
    
    static func hAppend(_ l1: HCons<D, A>, _ l2: B) -> HCons<D, C> {
        return HCons(
            l1.head
        )
    }
}
*/

/*
extension App3: HAppend where T == HAppendConstructor, A == HNil, B: HList, C == B {
    typealias Left = A
    typealias Right = B
    typealias Result = C
    
    static func append(_ l1: HNil, _ l2: B) -> C {
        return l2
    }
}


extension App4: HAppendNil where T == HAppendConstructor, A == HNil, B: HList, C == B {
    typealias Left = A
    typealias Right = B
    typealias Result = C
    
    static func append(_ l1: HNil, _ l2: B) -> C {
        return l2
    }
}
*/

/*
extension App4: HAppendCons where T == HAppendConstructor, A: HList, B: HList, C: HList {
    typealias Left = HCons<D, A>
    typealias Right = B
    typealias Result = HCons<D, C>
    
    static func append(_ l1: HCons<D, A>, _ l2: B) -> HCons<D, C> {
        return HCons(l1.head, App4<T, A, B, C>.append(l1.tail, l2))
    }
}
*/

/*
extension App4 where T == HAppendConstructor, A == HNil, B: HList, C == B, D == Nothing {
    class HAppendNil: HAppend {
        typealias Left = A
        typealias Right = B
        typealias Result = C
        
        static func append(_ l1: HNil, _ l2: B) -> C {
            return l2
        }
    }
    
    static func hAppend(_ l1: HNil, _ l2: B) -> C {
        return HAppendNil.append(l1, l2)
    }
}
*/

/*
extension App6 where T == HAppendConstructor, A == HNil, B: HList, C == B, D == Nothing, E == Nothing {
    class HAppendNil: HAppend {
        typealias Left = A
        typealias Right = B
        typealias Result = C
        
        static func append(_ l1: A, _ l2: B) -> C {
            return l2
        }
    }
    
    static func hAppend(_ l1: A, _ l2: B) -> C {
        return HAppendNil.append(l1, l2)
    }
}

extension App6 where T == HAppendConstructor, A == HCons<D, E>, B: HList, C == HCons<D, F>, E: HConsProtocol, F: HList {
    class HAppendCons: HAppend {
        typealias Left = A
        typealias Right = B
        typealias Result = C
    
        static func append(_ l1: A, _ l2: B) -> C {
            return HCons(l1.head, App6<T, E, B, F, E.Head, E.Tail, F.Tail>.hAppend(l1.tail, l2))
        }
    }
    
    static func hAppend(_ l1: A, _ l2: B) -> C {
        return HAppendCons.append(l1, l2)
    }
}
*/
 
/*
extension App5: HAppend where T == HAppendConstructor, E: HAppend, E.Left == A, E.Right == B, E.Result == C {
    typealias Left = HCons<D, A>
    typealias Right = B
    typealias Result = HCons<D, C>
    
    static func append(_ l1: HCons<D, A>, _ l2: B) -> HCons<D, C> {
        return HCons(l1.head, E.append(l1.tail, l2))
    }
}

func hAppend<A: HList, B: HList, C: HList>(_ l1: A, _ l2: B) -> C {
    
}
 
*/
