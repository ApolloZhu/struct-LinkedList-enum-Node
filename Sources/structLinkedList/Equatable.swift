//
//  File.swift
//  
//
//  Created by Apollo Zhu on 5/19/20.
//

extension LinkedList: Equatable where Element: Equatable {
    /// Returns a Boolean value indicating whether two linked lists
    /// contain the same elements in the same order.
    ///
    /// You can use the equal-to operator (`==`) to compare any two linked list that store the same,
    /// `Equatable`-conforming element type.
    ///
    /// - Parameters:
    ///   - lhs: A linked list to compare.
    ///   - rhs: Another linked list to compare.
    @inlinable
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }
        for (v1, v2) in zip(lhs, rhs) {
            if v1 != v2 {
                return false
            }
        }
        return true
    }
}
