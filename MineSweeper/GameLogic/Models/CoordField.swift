//
//  CoordField.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 26.06.2025.
//

import Foundation

extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}

struct CoordField: Hashable, Comparable {
    let x: Int
    let y: Int
    
    static func < (_ lhs: CoordField, _ rhs: CoordField) -> Bool {
        if lhs.x == rhs.x {
            return lhs.y < rhs.y
        } else {
            return lhs.x < rhs.x
        }
    }
    
    static func == (_ lhs: CoordField, _ rhs: CoordField) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
        
}
