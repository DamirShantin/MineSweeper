//
//  GameMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.04.2025.
//

import Foundation
protocol GameMineSweeperProtocol {
    var field: [[Int]] {get set}
    var bombs: [[Int]] {get set}
    
    func mineSweeper(bombs: [[Int]], rows: Int, columns: Int) -> [[Int]]
    func createMineSweeper()
}

class GameMineSweeper: GameMineSweeperProtocol {
    
    
    var field: [[Int]] = [[]]
    var bombs: [[Int]] = [[]]
    
    func mineSweeper(bombs: [[Int]], rows: Int, columns: Int) -> [[Int]] {
        var field = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        
        for bomb in bombs {
            let row = bomb[0]
            let column = bomb[1]
            field[row][column] = -1
            for i in column - 1 ... column + 1 {
                for j in row - 1 ... row + 1 {
                    if (i >= 0) && (i < columns) && (j >= 0) && (j < rows) && (field[j][i] != -1) {
                        field[j][i] += 1
                    }
                }
            }
        }
        
        return field
    }
    
    func createMineSweeper(rows: Int, columns: Int) {
        self.field = mineSweeper(bombs: self.bombs, rows: rows, columns: columns)
    }
}

