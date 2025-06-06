//
//  GameMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.04.2025.
//

import Foundation
protocol GameLogicMineSweeperProtocol {
    var field: [[GameCell]] {get set}
    var bombs: [[Int]] {get set}
    var checkBombs: [[Int]] {get set}
    
    func createMineSweeper(bombs: [[Int]], rows: Int, columns: Int)
    func click(field: [[GameCell]], givenI: Int, givenJ: Int) -> [[GameCell]]
}

class GameLogicMineSweeper: GameLogicMineSweeperProtocol {
    
    var field = [[GameCell]]()
    var bombs = [[Int]]()
    var checkBombs = [[Int]]()
    
    
    func createMineSweeper(bombs: [[Int]], rows: Int, columns: Int) {
        var field = Array(repeating: Array(repeating: GameCell(value: 0), count: columns), count: rows)
        
        for bomb in bombs {
            let row = bomb[0]
            let column = bomb[1]
            field[row][column].value = -1
            for i in row - 1 ... row + 1 {
                for j in column - 1 ... column + 1 {
                    if (i >= 0) && (i < rows) && (j >= 0) && (j < columns) && (field[i][j].value != -1) {
                        field[i][j].value += 1
                    }
                }
            }
        }
        
        self.field = field
    }
    
    func click(field: [[GameCell]], givenI: Int, givenJ: Int) -> [[GameCell]]  {
        var queue = Queue<[Int]>()
        var newField = field
        let rows = newField.count
        let columns = newField.first?.count
        
        if newField[givenI][givenJ].value == 0 {
            newField[givenI][givenJ].value = -2
            newField[givenI][givenJ].clicked = true
            
            queue.enqueue(element: [givenI, givenJ])
        } else {
            newField[givenI][givenJ].clicked = true
            return newField
        }
        while !queue.isEmpty {
            let position = queue.dequeue()
            for i in (position?.first)! - 1 ... (position?.first)! + 1 {
                for j in (position?.last)! - 1 ... (position?.last)! + 1 {
                    if (i >= 0) && (i < rows) && (j >= 0) && (j < columns!) && (newField[i][j].value != -1) {
                        newField[i][j].clicked = true
                        if newField[i][j].value == 0 {
                            newField[i][j].value = -2
                            queue.enqueue(element: [i,j])
                        }
                        
                    }
                }
            }
        }
        return newField

    }
    
    
    
}

