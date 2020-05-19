/// Pure value type singly linked list.
///
/// - Note: This is similar to how lists work in ML/Racket. No mutations (sort of).
public struct LinkedList<Element> {
    internal enum Node {
        case value(Element)
        indirect case node(value: Element, next: Node)
    }

    internal var head: Node? = nil
    /// The number of elements in this linked list.
    public internal(set) var count: Int = 0

    public init() { }
}
