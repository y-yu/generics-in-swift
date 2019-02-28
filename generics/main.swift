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
//typealias AppA = App4<A, B, C, Int>
//typealias AppB = App4<AA, B, CC, String>
typealias AppC = App1<B>
typealias AppA = App4<AA, B, CC, Int>
typealias AppB = App4<HNil, B, B, String>

//let app = AppA(a, b)

//let tmp = Impl<AA, B, String>.get()

/*
func makeBox<A: App4Protocol, H: HAppend>(_ a: A) -> H {
    return 
}
*/

let append = BoxWithEV<BoxWithEV<AppC, AppB>, AppA>.append(a, b)
print(append)

//let append = BoxWithEV<BoxWithEV<Box<AppC>, AppB>, AppA>
