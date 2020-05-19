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

 - [ ] CustomDebugStringConvertible
 - [ ] CustomReflectable
 - [x] CustomStringConvertible
 - [ ] CVarArg
 - [ ] Decodable when Element conforms to Decodable.
 - [ ] Encodable when Element conforms to Encodable.
 - [ ] Equatable when Element conforms to Equatable.
 - [x] ExpressibleByArrayLiteral
 - [ ] Hashable when Element conforms to Hashable.
 - [x] MutableCollection
    - [ ] Check Sequence conformance performance
    - [ ] Check Collection conformance performance
    - [ ] Check MutableCollection conformance performance
    - [ ] Implement some methods that usually requires BidirectionalCollection
        - [x] reversed
 - [ ] RangeReplaceableCollection
