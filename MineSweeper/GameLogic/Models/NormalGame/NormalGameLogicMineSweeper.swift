//
//  NormalGameLogicMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 22.10.2025.
//

import Foundation

final class NormalGameLogicMineSweeper: GameLogicMineSweeperProtocol {
    var field = [[GameCell]]()
    var bombs = [CoordField]()
    var checkBombs = [CoordField]()
    var gameStatus: GameStatus = .start
    let createManager = CreateFieldGameMineSweeper()
    
    func createMineSweeper(bombs: [CoordField], rows: Int, columns: Int) -> [[GameCell]] {
        if gameStatus == .start {
            return Array(repeating: Array(repeating: GameCell(value: 0), count: columns), count: rows)
        } else {
            return createManager.createMineSweeper(bombs: bombs, rows: rows, columns: columns)
        }
    }
    
    func click(field: [[GameCell]], givenI: Int, givenJ: Int) -> [[GameCell]] {
        let rows = field.count
        let columns = field.first!.count
        
        if gameStatus == .start {
            let bombs = createManager.createBobms(rows: rows, columns: columns, givenI: givenI, givenJ: givenJ)
            self.bombs = bombs
            let newField = createManager.createMineSweeper(bombs: bombs, rows: rows, columns: columns)
            self.gameStatus = .game
//            self.field = newField
            return click(field: newField, givenI: givenI, givenJ: givenJ)
        } else {
            var queue = Queue<[Int]>()
            var newField = field
            let rows = newField.count
            let columns = newField.first?.count
            
            if gameStatus == .start {
                gameStatus = .game
            }
            
            if newField[givenI][givenJ].value == -1 {
                self.gameStatus = .lose
            }
            
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
    
    func marked(field: [[GameCell]], givenI: Int, givenJ: Int) -> [[GameCell]] {
        var newField = field
        newField[givenI][givenJ].marked.toggle()
        self.checkBombs.append(CoordField(x: givenI, y: givenJ))
        
        print(bombs)
        print(checkBombs)
        
        if bombs.containsSameElements(as: checkBombs) {
            self.gameStatus = .win
        }
        return newField
    }
    
    
}
