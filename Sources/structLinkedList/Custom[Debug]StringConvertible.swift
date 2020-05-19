extension LinkedList: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return "[\(head?.description ?? "")]"
    }
    
    public var debugDescription: String {
        return "[\(head?.debugDescription ?? "")]"
    }
}

extension LinkedList.Node: CustomStringConvertible, CustomDebugStringConvertible {
    internal var description: String {
        // Actually, Swift Array uses debugDescription for description...
        // I guess that's understandable, but no thanks.
        switch self {
        case let .node(value: value, next: next):
            return "\(value), \(next.description)"
        case let .value(value):
            return "\(value)"
        }
    }
    
    internal var debugDescription: String {
        // Mimic _makeCollectionDescription from ArrayShared.swift
        var result = ""
        switch self {
        case let .node(value: value, next: next):
            debugPrint(value, terminator: "", to: &result)
            result += ", " + next.debugDescription
        case let .value(value):
            debugPrint(value, terminator: "", to: &result)
        }
        return result
    }
}
