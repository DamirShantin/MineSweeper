//
//  CreateFieldGameMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 22.10.2025.
//

import Foundation

final class CreateFieldGameMineSweeper {
    
    let mineCount = MineCountService()
    
    func createMineSweeper(bombs: [CoordField], rows: Int, columns: Int) -> [[GameCell]] {
        var field = Array(repeating: Array(repeating: GameCell(value: 0), count: columns), count: rows)
        
        for bomb in bombs {
            let row = bomb.x
            let column = bomb.y
            field[row][column].value = -1
            for i in row - 1 ... row + 1 {
                for j in column - 1 ... column + 1 {
                    if (i >= 0) && (i < rows) && (j >= 0) && (j < columns) && (field[i][j].value != -1) {
                        field[i][j].value += 1
                    }
                }
            }
        }
        return field
    }
    
    func createBobms(rows: Int, columns: Int, givenI: Int, givenJ: Int) -> [CoordField] {
        var bombs: [CoordField] = []
        let given = CoordField(x: givenI, y: givenJ)
        
        var countBombs = mineCount.createNumbersOfBombs(rows: rows, columns: columns)
        print(countBombs)
        
        while countBombs > 0 {
            let i =  Int.random(in: 0..<rows)
            let j =  Int.random(in: 0..<columns)
            let bomb = CoordField(x: i, y: j)
            
            if bomb != given {
                bombs.append(bomb)
            }
            countBombs -= 1
        }
        return bombs
    }
}

