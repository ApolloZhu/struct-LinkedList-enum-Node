extension LinkedList {
    public mutating func reverse() {
        guard let head = head, let next = head.next else { return }
        self.head = reversed(next, previous: .value(head.value))
    }
    
    private func reversed(_ current: Node, previous: Node) -> Node {
        let now = Node.node(value: current.value, next: previous)
        if let next = current.next {
            return reversed(next, previous: now)
        } else {
            return now
        }
    }
}
