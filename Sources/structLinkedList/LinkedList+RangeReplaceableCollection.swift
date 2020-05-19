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
        let reversed = newElements.reversed()
        self.head = insert(reversed: reversed,
                           replacedRange: subrange,
                           current: head)
        self.count += reversed.count - subrange.count
    }
    
    private func insert(reversed: [Element],
                        replacedRange: Range<Int>,
                        current: Node?, _ i: Int = 0) -> Node? {
        func recurseForNodeAfter(
            then map: (Node, Node?) -> Node? = { _, after in after }
        ) -> Node? {
            guard let current = current else {
                indexOutOfRange()
            }
            return map(current, insert(
                reversed: reversed,
                replacedRange: replacedRange,
                current: current.next, i + 1
            ))
        }
        
        switch i {
        case replacedRange.lowerBound:
            // MARK: Step 2: found the insertion point, recurse until part 2
            // current is the part 2 head if there's nothing to remove
            let after = replacedRange.isEmpty ? current : recurseForNodeAfter()
            // MARK: Step 5: reversely append newElements in front of part 2
            guard let first = reversed.first else {
                return after
            }
            var newElementHead: Node = .auto(value: first, next: after)
            for element in reversed.dropFirst() {
                newElementHead = .node(value: element, next: newElementHead)
            }
            return newElementHead
        case replacedRange:
            // MARK: Step 3: skip this current value/node until part 2 begins
            return recurseForNodeAfter()
        case replacedRange.upperBound...:
            // MARK: Step 4: get the part after the replacement range
            // we don't need to validate the indices/current node
            // since we reached here no problem
            return current
        default: // case ..<replacedRange.lowerBound:
            // MARK: Step 1: recurse until insertion point
            return recurseForNodeAfter { current, after in
                // MARK: Step 6: insert back the part before insertion point
                .auto(value: current.value, next: after)
            }
        }
    }
    
    /// - Complexity: O(n)
    public mutating func append(_ newElement: __owned Element) {
        insert(newElement, at: endIndex)
    }
    
    /// - Complexity: O(m + n) where m = S.count
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
