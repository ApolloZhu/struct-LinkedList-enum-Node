extension LinkedList {
    /// Reverses the elements of the collection in place.
    ///
    /// The following example reverses the elements
    /// of a linked list of characters:
    ///
    ///     var characters: LinkedList<Character> = ["C", "a", "f", "é"]
    ///     characters.reverse()
    ///     print(characters)
    ///     // Prints "[é, f, a, C]"
    ///
    /// - Complexity: O(*n*),
    ///   where *n* is the number of elements in the collection.
    public mutating func reverse() {
        guard let head = head, let next = head.next else { return }
        self.head = reversed(next, previous: .value(head.value))
    }

    private func reversed(_ current: Node, previous: Node) -> Node {
        let now: Node = .node(value: current.value, next: previous)
        if let next = current.next {
            return reversed(next, previous: now)
        } else {
            return now
        }
    }
}
