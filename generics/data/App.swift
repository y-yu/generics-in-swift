protocol App4Protocol {
    associatedtype A: HList
    associatedtype B: HList
    associatedtype C: HList
    associatedtype D
}

// In the presentation, I choiced `class` rather than `struct`,
// But I think it's good either `class` or `struct`
// if not considering efficiency.
class App1<A: HList> {
    init() {}
}

// This is a `App5` which I introduced in my presentation.
/*
class App5<A: HList, B: HList, C: HList, D, EV: HAppend> {
    init() {}
}
*/

// Insted of `App5`, I have to use `App4`.
// The reason why I used this is written above of the `AppWithEV`.
class App4<A: HList, B: HList, C: HList, D>: App4Protocol {
    init() {}
}

// And this is a tuple of `App4` and `EV`, which represents `App5`.
// In my presentation, I used `App5` which has 5 type parameters
// including `EV`. But Swift compiler cannot compile using `App5`...
// Considering the limited presentation time, I used `App5` version to
// make my presentation be more simplly.
class AppWithEV<EV: HAppend, X: App4Protocol> {}
