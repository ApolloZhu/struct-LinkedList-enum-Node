extension LinkedList.Node {
    @inlinable
    static func auto(value: Element,
                     next: LinkedList.Node? = nil) -> LinkedList.Node {
        if let next = next {
            return .node(value: value, next: next)
        } else {
            return .value(value)
        }
    }

    @inlinable
    internal var value: Element {
        get {
            switch self {
            case .node(let value, _):
                return value
            case .value(let value):
                return value
            }
        }
        set {
            self = .auto(value: newValue, next: next)
        }
    }

    @inlinable
    internal var next: LinkedList.Node? {
        get {
            if case .node(_, next: let next) = self {
                return next
            }
            return nil
        }
        set(newNext) {
            self = .auto(value: value, next: newNext)
        }
    }
}
