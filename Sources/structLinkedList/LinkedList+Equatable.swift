//
//  File.swift
//  
//
//  Created by Apollo Zhu on 5/19/20.
//

extension LinkedList: Equatable where Element: Equatable {
    @inlinable
    public static func == (lhs: Self, rhs: Self) -> Bool {
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
