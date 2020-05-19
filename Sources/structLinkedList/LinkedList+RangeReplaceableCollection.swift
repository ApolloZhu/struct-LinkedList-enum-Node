extension LinkedList: RangeReplaceableCollection {
    public mutating func replaceSubrange<C: Collection>(
        _ subrange: Range<Int>,
        with newElements: __owned C
    ) where C.Element == Element {
        replaceSubrangeS(subrange, with: newElements)
    }
    
    private mutating func replaceSubrangeS<S: Sequence>(
        _ subrange: Range<Int>,
        with newElements: __owned S
    ) where S.Element == Element {
        // Basic idea is that for this:
        //
        // [part 1] [L. old elements] [C. new elements] [part 2]
        //
        // to happen in an O(m + n) complexity, we'll
        //
        // 1. reach the head of part 2, and return
        // 2. insert elements from new elements reversly
        //    (can improve performance by checking RandomAccess/Bidirectional)
        // 3. (implicitly) copy elements from part 1 reversely
        let reversed = newElements.reversed()
        self.head = insert(reversed: reversed,
                           replacedRange: subrange,
                           current: head)
        self.count += reversed.count - subrange.count
    }
    
    private func insert(reversed: [Element],
                        replacedRange: Range<Int>,
                        current: Node?, _ i: Int = 0) -> Node? {
        func getNodeAfter() -> Node? {
            guard let current = current else {
                indexOutOfRange()
            }
            return insert(
                reversed: reversed,
                replacedRange: replacedRange,
                current: current.next, i + 1
            )
        }
        
        switch i {
        case replacedRange.lowerBound:
            let after = replacedRange.isEmpty ? current : getNodeAfter()
            // add in elements from the newElements
            guard let first = reversed.first else {
                return after
            }
            var newElementHead: Node = .auto(value: first, next: after)
            for element in reversed.dropFirst() {
                newElementHead = .node(value: element, next: newElementHead)
            }
            return newElementHead
        case replacedRange.upperBound...:
            // get the part after the replacement range
            // we don't need to validate the indices/current node
            // since we reached here no problem
            return current
        default:
            // for either part 1 to keep or old elements to remove
            // the indices must be valid (and thus have an element)
            if i < replacedRange.startIndex {
                // 1. insert the parts before, including self value
                return .auto(value: current!.value, next: getNodeAfter())
            } else {
                // 2. skip self value until part 2 begins
                return getNodeAfter()
            }
        }
    }
    
    /// - Complexity: O(n)
    public mutating func append(_ newElement: __owned Element) {
        insert(newElement, at: endIndex)
    }
    
    /// - Complexity: O(m + n) where |S| = m and |self| = n
    public mutating func append<S: Sequence>(
        contentsOf newElements: __owned S
    ) where S.Element == Element {
        // The default implementation has O(m * n) complexity
        replaceSubrangeS(endIndex..<endIndex, with: newElements)
    }
    
    /// - Complexity: O(`lhs.count`)
    public static func + <Other: Sequence>(
        lhs: Other, rhs: Self
    ) -> Self where Element == Other.Element {
        var rhs = rhs
        rhs.replaceSubrangeS(rhs.startIndex..<rhs.startIndex, with: lhs)
        return rhs
    }
}
