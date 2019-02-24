let oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15]

/*
let inj = oddNumbers.inj()

extension App1 where T == ArrayConstructor {
    func length() -> Int {
        let a = self.prj()
        return a.count
    }
}
*/

let aa = HCons("string", HNil.hNil)

let a = HCons(1, HCons("string", HNil.hNil))
let b = HCons(true, HCons(1.001, HNil.hNil))

typealias AA = HCons<String, HNil>
typealias A = HCons<Int, AA>
typealias BB = HCons<Double, HNil>
typealias B = HCons<Bool, BB>
typealias CC = HCons<String, B>
typealias C = HCons<Int, CC>
typealias AppA = App4<A, B, C, Int>
typealias AppB = App4<AA, B, CC, String>
typealias AppC = App1<B>

//let app = AppA(a, b)

class Either<A, B> {}

class Left<A>: Either<A, Nothing> {}
class Right<A>: Either<Nothing, A> {}

protocol GetEVNil {
    associatedtype Pred = Either<GetEVNil, GetEVHCons>
    associatedtype EV: HAppend
    associatedtype Right1: HList
}

protocol GetEVHCons {
    associatedtype Pred: Either<GetEVNil, GetEVHCons>
    associatedtype EV: HAppend
    associatedtype Left: HList
    associatedtype Right2: HList
    associatedtype X
}

extension Impl: GetEVHNil where A == HNil {
    typealias Right1 = B
    typealias Pred = Impl
    typealias EV = App1<B>
}

struct Impl<A: HList, B: HList, C> {}

extension Impl: GetEVHCons where A: HList {
    typealias Left = HNil
    typealias Right2 = B
    typealias X = C
    typealias Pred = Impl<A.Tail, B, A.Head>
    typealias EV = BoxWithEV<Pred.EV, App4<HCons<C, A>, B, HCons<C, Pred.EV.Result>, C>>
    
    func get() -> EV {
        return EV()
    }
}


//let tmp = Impl<AA, B, String>.get()


let append = BoxWithEV<BoxWithEV<AppC, AppB>, AppA>.append(a, b)
print(append)

//let append = BoxWithEV<BoxWithEV<Box<AppC>, AppB>, AppA>
