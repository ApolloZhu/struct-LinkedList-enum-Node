public struct LinkedList<Element> {
    fileprivate enum Node {
        case value(Element)
        indirect case node(value: Element, next: Node)
    }
    private var head: Node? = nil

    public init() { }
}

// MARK: - Node Accessor

extension LinkedList.Node {
    fileprivate var value: Element {
        get {
            switch self {
            case .node(let value, next: _):
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
    }
}

// MARK: - Collection

extension LinkedList: Collection {
    public var startIndex: Int {
        return 0
    }

    public var endIndex: Int {
        return head?.count ?? 0
    }

    public func index(after i: Int) -> Int {
        return i + 1
    }

    fileprivate func indexOutOfRange() -> Never {
        fatalError("Index out of range")
    }
}

extension LinkedList.Node {
    fileprivate var count: Int {
        return (next?.count ?? 0) + 1
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
            if position < 0 {
                indexOutOfRange()
            }
            if position == 0 {
                if let oldHead = head {
                    head = .node(value: newValue, next: oldHead)
                } else {
                    head = .value(newValue)
                }
                return
            }
            guard var cur = head else {
                indexOutOfRange()
            }
            #warning("NOT IMPLEMENTED")
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
    }

    private func append(_ current: Node, newNode: Node) -> Node {
        if let next = current.next {
            return .node(value: current.value, next: append(next, newNode: newNode))
        } else {
            return .node(value: current.value, next: newNode)
        }
    }
}

// MARK: - Reverse

extension LinkedList {
    public mutating func reverse() {
        guard let head = head, let next = head.next else { return }
        self.head = reversed(next, previous: .value(head.value))
    }

    private func reversed(_ node: Node, previous: Node) -> Node {
        let now = Node.node(value: node.value, next: previous)
        if let next = node.next {
            return reversed(next, previous: now)
        } else {
            return now
        }
    }
}

extension LinkedList.Node {

}

// MARK: - Testing

var list: LinkedList = [0, 1, 2, 3]
list.reverse()
list.append(-1)
