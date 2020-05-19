extension LinkedList: Collection {
    public var startIndex: Int {
        return 0
    }

    public var endIndex: Int {
        return count
    }

    public func index(after i: Int) -> Int {
        return i + 1
    }

    internal func indexOutOfRange(
        file: StaticString = #file, line: UInt = #line
    ) -> Never {
        preconditionFailure("Index out of range", file: file, line: line)
    }
}
