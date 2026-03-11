//
//  Field.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 30.06.2025.
//

import Foundation

struct GameField: Comparable, Hashable {
    
    var name: String
    var rows: Int
    var columns: Int
    var bombs: [CoordField]
    var id: String
    
    static func < (lhs: GameField, rhs: GameField) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (_ lhs: GameField, _ rhs: GameField) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    
}
