extension LinkedList: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        let reversed = elements.reversed()
        guard let first = reversed.first else {
            return
        }
        var cur = Node.value(first)
        for value in reversed.dropFirst() {
            cur = .node(value: value, next: cur)
        }
        head = cur
        count = elements.count
    }
}
