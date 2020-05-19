extension LinkedList: Collection {
    public var indices: Range<Int> {
        return startIndex..<endIndex
    }

    @inlinable
    public var startIndex: Int {
        return 0
    }

    @inlinable
    public var endIndex: Int {
        @inlinable
        get {
            return count
        }
    }

    /// - Complexity: O(1)
    @inlinable
    public func index(after i: Int) -> Int {
        return i + 1
    }

    /// - Complexity: O(1)
    @inlinable
    public func index(_ i: Int, offsetBy distance: Int) -> Int {
        return i + distance
    }

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

    /// - Complexity: O(1)
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
