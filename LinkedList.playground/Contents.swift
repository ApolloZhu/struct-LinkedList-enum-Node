public struct LinkedList<Element> {
    fileprivate enum Node {
        case value(Element)
        indirect case node(value: Element, next: Node)
    }
    private var head: Node? = nil
    public private(set) var count: Int = 0

    public init() { }
}

// MARK: - Node Accessor

extension LinkedList.Node {
    fileprivate var value: Element {
        get {
            switch self {
            case .node(let value, _):
                return value
            case .value(let value):
                return value
            }
        }
        set {
            if case .node(_, next: let next) = self {
                self = .node(value: newValue, next: next)
            } else {
                self = .value(newValue)
            }
        }
    }

    fileprivate var next: LinkedList.Node? {
        get {
            if case .node(_, next: let next) = self {
                return next
            }
            return nil
        }
        set {
            if let newNext = newValue {
                self = .node(value: value, next: newNext)
            } else {
                self = .value(value)
            }
        }
    }
}

// MARK: - CustomStringConvertible

extension LinkedList: CustomStringConvertible {
    public var description: String {
        return "[\(head?.description ?? "")]"
    }
}

extension LinkedList.Node: CustomStringConvertible {
    fileprivate var description: String {
        if let next = next {
            return "\(value), \(next.description)"
        } else {
            return "\(value)"
        }
    }
}

// MARK: - Array Literal

extension LinkedList: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        let reversed = elements.reversed()
        guard let first = reversed.first else {
            return
        }
        var cur = Node.value(first)
        for value in reversed.dropFirst() {
            cur = .node(value: value, next: cur)
        }
        head = cur
        count = elements.count
    }
}

// MARK: - Collection

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

    fileprivate func indexOutOfRange() -> Never {
        fatalError("Index out of range")
    }

    public struct Iterator: IteratorProtocol {
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

// MARK: - MutableCollection

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

extension LinkedList {
    mutating func append(_ newElement: Element) {
        guard let head = head else {
            self.head = .value(newElement)
            return
        }
        self.head = append(head, newNode: .value(newElement))
        count += 1
    }

    private func append(_ current: Node, newNode: Node) -> Node {
        switch current {
        case let .node(value: value, next: next):
            return .node(value: value, next: append(next, newNode: newNode))
        case let .value(value):
            return .node(value: value, next: newNode)
        }
    }
}

// MARK: - Reverse

extension LinkedList {
    public mutating func reverse() {
        guard let head = head, let next = head.next else { return }
        self.head = reversed(next, previous: .value(head.value))
    }

    private func reversed(_ current: Node, previous: Node) -> Node {
        let now = Node.node(value: current.value, next: previous)
        if let next = current.next {
            return reversed(next, previous: now)
        } else {
            return now
        }
    }
}

extension LinkedList.Node {

}

// MARK: - Testing

var list: LinkedList = [0,1,2,3,4,5,6,7,8,9]
list.count
list.reversed()
for e in list {
    print(e)
}
list.reverse()
list.append(-1)
list.count
// list[-1]
// list[-1] = 0
list[0]
list[0] = 5
list[1]
list[1] = 6
list[2]
list[2] = 7
list[3]
list[3] = 8
list[4]
list[4] = 9
// list[5]
// list[5] = 0
list
list.count
