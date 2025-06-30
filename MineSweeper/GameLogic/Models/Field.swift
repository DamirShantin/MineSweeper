//
//  Field.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 30.06.2025.
//

import Foundation

struct Field {
    var name: String
    var rows: Int
    var columns: Int
    var bombs: [CoordField]
}
