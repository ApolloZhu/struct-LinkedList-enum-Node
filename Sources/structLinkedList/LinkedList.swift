public struct LinkedList<Element> {
    internal enum Node {
        case value(Element)
        indirect case node(value: Element, next: Node)
    }
    
    internal var head: Node? = nil
    public internal(set) var count: Int = 0
    
    public init() { }
}
