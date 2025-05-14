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
    
    func createMineSweeper(bombs: [[Int]], rows: Int, columns: Int)
    func click(field: inout [[Int]], givenI: Int, givenJ: Int) -> [[Int]]
}

class GameMineSweeper: GameMineSweeperProtocol {
    var field = [[Int]]()
    var bombs = [[Int]]()
    
    func createMineSweeper(bombs: [[Int]], rows: Int, columns: Int) {
        var field = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        
        for bomb in bombs {
            let row = bomb[0]
            let column = bomb[1]
            field[row][column] = -1
            for i in row - 1 ... row + 1 {
                for j in column - 1 ... column + 1 {
                    if (i >= 0) && (i < rows) && (j >= 0) && (j < columns) && (field[i][j] != -1) {
                        field[i][j] += 1
                    }
                }
            }
        }
        
        self.field = field
    }
    
    func click(field: inout [[Int]], givenI: Int, givenJ: Int) -> [[Int]] {
        var queue = Queue<[Int]>()
        let rows = field.count
        let columns = field.first?.count
        
        if field[givenI][givenJ] == 0 {
            field[givenI][givenJ] = -2
            queue.enqueue(element: [givenI, givenJ])
        } else {
            return field
        }
        while !queue.isEmpty {
            let position = queue.dequeue()
            for i in (position?.first)! - 1 ... (position?.first)! + 1 {
                for j in (position?.last)! - 1 ... (position?.last)! + 1 {
                    if (i >= 0) && (i < rows) && (j >= 0) && (j < columns!) && (field[i][j] == 0) {
                        field[i][j] = -2
                        queue.enqueue(element: [i,j])
                    }
                }
            }
        }
        
        return field

    }
}

