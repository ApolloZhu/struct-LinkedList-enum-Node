extension LinkedList: Encodable where Element: Encodable {
    /// Encodes the elements of this linked list into the given encoder in an unkeyed container.
    ///
    /// This function throws an error if any values are invalid for the given encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for element in self {
            try container.encode(element)
        }
    }
}

extension LinkedList: Decodable where Element: Decodable {
    /// Creates a new linked list by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails,
    /// or if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        self.init(try [Element](from: decoder))
    }
}
