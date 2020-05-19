extension LinkedList {
    /// Iterates over a linked list by following the link to ensure O(n) complexity iterations.
    public struct Iterator: IteratorProtocol, Sequence {
        private var current: Node?
        
        public mutating func next() -> Element? {
            guard let current = current else {
                return nil
            }
            defer { self.current = current.next }
            return current.value
        }
        
        fileprivate init(head: Node?) {
            current = head
        }
    }
    
    public func makeIterator() -> Iterator {
        return Iterator(head: head)
    }
}
