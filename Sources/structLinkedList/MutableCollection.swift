extension LinkedList: MutableCollection {
    public subscript(position: Int) -> Element {
        _read {
            guard var cur = head else {
                indexOutOfRange()
            }
            var i = position
            while i > 0, let next = cur.next {
                cur = next
                i -= 1
            }
            guard i == 0 else {
                indexOutOfRange()
            }
            yield cur.value
        }
        set(newValue) {
            self.head = set(position, to: newValue, current: head)
        }
    }
    
    private func set(_ i: Int, to newValue: Element, current: Node?) -> Node {
        guard let current = current else {
            guard i == 1 else {
                indexOutOfRange()
            }
            return .value(newValue)
        }
        if i == 0 {
            if case .node(_, next: let next) = current {
                return .node(value: newValue, next: next)
            }
            return .value(newValue)
        } else if i > 0 {
            return .node(value: current.value, next: set(i - 1, to: newValue, current: current.next))
        } else {
            indexOutOfRange()
        }
    }
}
