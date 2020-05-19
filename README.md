# `struct LinkedList` `enum Node`

LinkedList in Swift, but you get a value type instead. What a terrible idea.

```swift
public struct LinkedList<Element> {
    private enum Node {
        case value(Element)
        indirect case node(value: Element, next: Node)
    }
}
```
