let a = HCons(1, HCons("string", HNil.hNil))
let b = HCons(true, HCons(1.001, HNil.hNil))

typealias AA = HCons<String, HNil>
typealias A = HCons<Int, AA>
typealias BB = HCons<Double, HNil>
typealias B = HCons<Bool, BB>
typealias CC = HCons<String, B>
typealias C = HCons<Int, CC>
typealias AppC = App1<B>
typealias AppA = App4<AA, B, CC, Int>
typealias AppB = App4<HNil, B, B, String>

let append = AppWithEV<AppWithEV<AppC, AppB>, AppA>.append(a, b)
print(append)
