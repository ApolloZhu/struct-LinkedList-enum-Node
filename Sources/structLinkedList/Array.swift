extension LinkedList {
    mutating func append(_ newElement: Element) {
        guard let head = head else {
            self.head = .value(newElement)
            return
        }
        self.head = append(head, newNode: .value(newElement))
        count += 1
    }

    private func append(_ current: Node, newNode: Node) -> Node {
        switch current {
        case let .node(value: value, next: next):
            return .node(value: value, next: append(next, newNode: newNode))
        case let .value(value):
            return .node(value: value, next: newNode)
        }
    }
}
