extension LinkedList {
    /// Removes all elements from the linked list.
    ///
    /// - Complexity: O(1)
    public mutating func removeAll() {
        head = nil
        count = 0
    }
}
