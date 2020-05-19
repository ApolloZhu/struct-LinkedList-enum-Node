extension LinkedList: Encodable where Element: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for element in self {
            try container.encode(element)
        }
    }
}

extension LinkedList: Decodable where Element: Decodable {
    public init(from decoder: Decoder) throws {
        self.init(try [Element](from: decoder))
    }
}
