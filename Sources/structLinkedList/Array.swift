extension LinkedList {
    /// Removes all elements from the linked list.
    ///
    /// - Complexity: O(1)
    public mutating func removeAll() {
        head = nil
        count = 0
    }
}
/*

 /// Adds the elements of a sequence to the end of the array.
 ///
 /// Use this method to append the elements of a sequence to the end of this
 /// array. This example appends the elements of a `Range<Int>` instance
 /// to an array of integers.
 ///
 ///     var numbers = [1, 2, 3, 4, 5]
 ///     numbers.append(contentsOf: 10...15)
 ///     print(numbers)
 ///     // Prints "[1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15]"
 ///
 /// - Parameter newElements: The elements to append to the array.
 ///
 /// - Complexity: O(*m*) on average, where *m* is the length of
 ///   `newElements`, over many calls to `append(contentsOf:)` on the same
 ///   array.
 public mutating func append<S: Sequence>(
     contentsOf newElements: __owned S
 ) where S.Element == Element {
 }


 /// Removes and returns the element at the specified position.
 ///
 /// All the elements following the specified position are moved up to
 /// close the gap.
 ///
 ///     var measurements: [Double] = [1.1, 1.5, 2.9, 1.2, 1.5, 1.3, 1.2]
 ///     let removed = measurements.remove(at: 2)
 ///     print(measurements)
 ///     // Prints "[1.1, 1.5, 1.2, 1.5, 1.3, 1.2]"
 ///
 /// - Parameter index: The position of the element to remove. `index` must
 ///   be a valid index of the array.
 /// - Returns: The element at the specified index.
 ///
 /// - Complexity: O(*n*), where *n* is the length of the array.
 @inlinable
 @discardableResult
 public mutating func remove(at index: Int) -> Element {

 }

 /// Inserts a new element at the specified position.
 ///
 /// The new element is inserted before the element currently at the specified
 /// index. If you pass the array's `endIndex` property as the `index`
 /// parameter, the new element is appended to the array.
 ///
 ///     var numbers = [1, 2, 3, 4, 5]
 ///     numbers.insert(100, at: 3)
 ///     numbers.insert(200, at: numbers.endIndex)
 ///
 ///     print(numbers)
 ///     // Prints "[1, 2, 3, 100, 4, 5, 200]"
 ///
 /// - Parameter newElement: The new element to insert into the array.
 /// - Parameter i: The position at which to insert the new element.
 ///   `index` must be a valid index of the array or equal to its `endIndex`
 ///   property.
 ///
 /// - Complexity: O(*n*), where *n* is the length of the array. If
 ///   `i == endIndex`, this method is equivalent to `append(_:)`.
 @inlinable
 public mutating func insert(_ newElement: __owned Element, at i: Int) {


 /// Remove and return the element at the given index.
 ///
 /// - returns: The removed element.
 ///
 /// - Complexity: Worst case O(*n*).
 ///
 /// - Precondition: `count > index`.
 @discardableResult
 override mutating func remove(at index: Int) -> Element


 */
