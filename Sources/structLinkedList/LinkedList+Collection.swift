extension LinkedList: Collection {
    /// The indices that are valid for subscripting the collection, in ascending order.
    public var indices: Range<Int> {
        return startIndex..<endIndex
    }

    /// The position of the first element in a nonempty linked list.
    ///
    /// For an instance of `LinkedList`, `startIndex` is always zero.
    /// If the linked list is empty, `startIndex` is equal to `endIndex`.
    @inlinable
    public var startIndex: Int {
        return 0
    }

    /// The linked list's "past the end" position---that is,
    /// the position one greater than the last valid subscript argument.
    ///
    /// When you need a range that includes the last element of a linked list,
    /// use the half-open range operator (`..<`) with `endIndex`.
    /// The `..<` operator creates a range that doesn't include the upper bound,
    /// so it's always safe to use with `endIndex`. For example:
    ///
    ///     let numbers: LinkedList = [10, 20, 30, 40, 50]
    ///     if let i = numbers.firstIndex(of: 30) {
    ///         print(numbers[i ..< numbers.endIndex])
    ///     }
    ///     // Prints "[30, 40, 50]"
    ///
    /// If the linked list is empty, `endIndex` is equal to `startIndex`.
    @inlinable
    public var endIndex: Int {
        @inlinable
        get {
            return count
        }
    }

    @inlinable
    public func index(after i: Int) -> Int {
        return i + 1
    }

    /// Returns an index that is the specified distance from the given index.
    ///
    /// The following example obtains an index advanced four positions
    /// from a linked list's starting index and then prints the element at that position.
    ///
    ///     let numbers: LinkedList = [10, 20, 30, 40, 50]
    ///     let i = numbers.index(numbers.startIndex, offsetBy: 4)
    ///     print(numbers[i])
    ///     // Prints "50"
    ///
    /// The value passed as `distance` must not offset `i` beyond the bounds of the collection.
    ///
    /// - Parameters:
    ///   - i: A valid index of the array.
    ///   - distance: The distance to offset `i`.
    /// - Returns: An index offset by `distance` from the index `i`.
    ///   If `distance` is positive,
    ///   this is the same value as the result of `distance` calls to `index(after:)`.
    ///
    /// - Complexity: O(1)
    @inlinable
    public func index(_ i: Int, offsetBy distance: Int) -> Int {
        return i + distance
    }

    /// Returns an index that is the specified distance from the given index,
    /// unless that distance is beyond a given limiting index.
    ///
    /// The following example obtains an index advanced four positions
    /// from a linked list's starting index and then prints the element at that position.
    /// The operation doesn't require going beyond the limiting `numbers.endIndex` value,
    /// so it succeeds.
    ///
    ///     let numbers: LinkedList = [10, 20, 30, 40, 50]
    ///     if let i = numbers.index(numbers.startIndex,
    ///                              offsetBy: 4,
    ///                              limitedBy: numbers.endIndex) {
    ///         print(numbers[i])
    ///     }
    ///     // Prints "50"
    ///
    /// The next example attempts to retrieve an index ten positions from `numbers.startIndex`,
    /// but fails, because that distance is beyond the index passed as `limit`.
    ///
    ///     let j = numbers.index(numbers.startIndex,
    ///                           offsetBy: 10,
    ///                           limitedBy: numbers.endIndex)
    ///     print(j)
    ///     // Prints "nil"
    ///
    /// The value passed as `distance` must not offset `i` beyond the bounds of the collection,
    /// unless the index passed as `limit` prevents offsetting beyond those bounds.
    ///
    /// - Parameters:
    ///   - i: A valid index of this linked list.
    ///   - distance: The distance to offset `i`.
    ///   - limit: A valid index of the collection to use as a limit.
    ///     If `distance > 0`, `limit` has no effect if it is less than `i`.
    ///     Likewise, if `distance < 0`, `limit` has no effect if it is greater than `i`.
    /// - Returns: An index offset by `distance` from the index `i`,
    ///   unless that index would be beyond `limit` in the direction of movement.
    ///   In that case, the method returns `nil`.
    ///
    /// - Complexity: O(1)
    @inlinable
    public func index(
        _ i: Int, offsetBy distance: Int, limitedBy limit: Int
    ) -> Int? {
        let l = limit - i
        if distance > 0 ? l >= 0 && l < distance : l <= 0 && distance < l {
            return nil
        }
        return i + distance
    }

    /// Returns the distance between two indices.
    ///
    /// - Parameters:
    ///   - start: A valid index of the collection.
    ///   - end: Another valid index of the collection.
    ///     If `end` is equal to `start`, the result is zero.
    /// - Returns: The distance between `start` and `end`.
    @inlinable
    public func distance(from start: Int, to end: Int) -> Int {
        return end - start
    }

    internal func indexOutOfRange(
        file: StaticString = #file, line: UInt = #line
    ) -> Never {
        preconditionFailure("Index out of range", file: file, line: line)
    }
}
