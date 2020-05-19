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
        // [part 1] [old elements to remove] [new elements to insert] [part 2]
        //
        // to happen in an O(m + n) complexity, we'll
        //
        // 1. reach the head of part 2, and return
        // 2. insert elements from new elements reversly
        //    (can improve performance by checking RandomAccess/Bidirectional)
        // 3. (implicitly) copy elements from part 1 reversely
        let reversed = newElements.reversed()
        self.head = insert(reversed: reversed,
                           startingAt: subrange.lowerBound,
                           resumeOriginalAt: subrange.upperBound,
                           current: head)
        self.count += reversed.count - subrange.count
    }

    private func insert(reversed: [Element],
                        startingAt part1End: Int,
                        resumeOriginalAt part2Start: Int,
                        current: Node?, i: Int = 0) -> Node? {
        switch i {
        case part1End:
            let after: Node?
            // skip
            if part2Start == part1End {
                after = current
            } else {
                guard let current = current else {
                    indexOutOfRange()
                }
                after = insert(
                    reversed: [],
                    startingAt: part1End, resumeOriginalAt: part2Start,
                    current: current.next, i: i + 1
                )
            }
            // add in elements from the newElements
            guard let first = reversed.first else {
                return after
            }
            var newElementHead: Node = after
                .map { .node(value: first, next: $0) }
                ?? .value(first)
            for element in reversed.dropFirst() {
                newElementHead = .node(value: element, next: newElementHead)
            }
            return newElementHead
        case part2Start...:
            // get the part after the replacement range
            // we don't need to validate the indices/current node
            // since we reached here no problem
            return current
        case ..<part1End:
            // insert the parts before
            // skip until part 2 begins
            guard let current = current else {
                indexOutOfRange()
            }
            guard let after = insert(
                reversed: reversed,
                startingAt: part1End, resumeOriginalAt: part2Start,
                current: current.next, i: i+1)
                else { return .value(current.value) }
            return .node(value: current.value, next: after)
        default:
            // skip until part 2 begins
            guard let current = current else {
                indexOutOfRange()
            }
            return insert(
                reversed: reversed,
                startingAt: part1End, resumeOriginalAt: part2Start,
                current: current.next, i: i+1
            )
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

    public static func + <Other: Sequence>(
        lhs: Other, rhs: Self
    ) -> Self where Element == Other.Element {
        var rhs = rhs
        // This gives a minor improvement from O(lhs + rhs) to O(lhs)
        rhs.replaceSubrangeS(rhs.startIndex..<rhs.startIndex, with: lhs)
        return rhs
    }
}
