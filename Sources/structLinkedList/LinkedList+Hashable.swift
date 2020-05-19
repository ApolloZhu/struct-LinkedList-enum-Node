extension LinkedList: Hashable where Element: Hashable {
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(count) // discriminator
        for element in self {
            hasher.combine(element)
        }
    }
}
