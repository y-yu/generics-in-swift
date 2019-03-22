PoC of Generics in protocol/extension
=====================================

This is a proof of the concept of _Generics in protocol/extension_ on
[try! Swift Tokyo 2019](https://www.tryswift.co/events/2019/tokyo/jp/#).

## Difference of the presentation's code

- In the presentation, `App5` was used but this is using `App4` and
  `AppWithEV` instead of `App5`
  - Swift compiler cannot compile `App5` version but if I cannot have
    enough time to explain why I have to use `AppWithEV`. And `AppWithEV` is
    just a tuple of `EV` and `other` so it almost equals to `App5` I suppose.
    So I decided to use `App5` rather than `AppWithEV` to make my presentation
    be more simplly.
