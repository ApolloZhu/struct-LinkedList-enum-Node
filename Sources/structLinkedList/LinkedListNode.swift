extension LinkedList.Node {
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
            if case .node(_, next: let next) = self {
                self = .node(value: newValue, next: next)
            } else {
                self = .value(newValue)
            }
        }
    }

    internal var next: LinkedList.Node? {
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
