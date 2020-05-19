# `struct LinkedList` `enum Node`

Singly linked list in Swift, but you get a value type instead. What a terrible idea.

```swift
public struct LinkedList<Element> {
    private enum Node {
        case value(Element)
        indirect case node(value: Element, next: Node)
    }
}
```

## Road Map

 - [x] CustomDebugStringConvertible
 - [ ] CustomReflectable
 - [x] CustomStringConvertible
 - [x] ~~CVarArg~~
    ```
    Declaring conformance to the CVarArg protocol for types defined outside the standard library is not supported.
    ```
 - [x] Decodable when Element conforms to Decodable.
 - [x] Encodable when Element conforms to Encodable.
 - [x] Equatable when Element conforms to Equatable.
 - [x] ExpressibleByArrayLiteral
 - [x] Hashable when Element conforms to Hashable.
 - [x] MutableCollection
    - [ ] Benchmark Sequence conformance performance
    - [ ] Benchmark Collection conformance performance
    - [ ] Benchmark MutableCollection conformance performance
    - [ ] Implement some methods that usually requires BidirectionalCollection
        - [x] reversed
        - [ ] ...
 - [x] RangeReplaceableCollection
     - [ ] Benchmark, since default implementations are of real nightmare
- [x] Try to be like Array
    - [ ] Implement slices like [ArraySlice](https://github.com/apple/swift/blob/master/stdlib/public/core/ArraySlice.swift)?
