//
//  CreateFieldsViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 12.05.2025.
//

import Foundation

class CreateFieldsViewModel: ObservableObject, FieldValidationProtocol {
    @Published var field = [[Bool]]()
    @Published var countBombs: Int = 0 // test
    
    var gameField: GameField?
    var numberOfBombs = MineCountService() // test
    
    var rows: Int = 4
    var columns: Int = 4
    
    var bombs = [CoordField]()
    
    init(gameField: GameField?){
        self.gameField = gameField
        config()
        createField()
    }
    
    func numberOfBombsInField() { // test
        let count = numberOfBombs.createNumbersOfBombs(rows: rows, columns: columns)
            countBombs = count  
    }
    
    func createField() {
        if !bombs.isEmpty {
            var grid = Array(repeating: Array(repeating: true, count: self.columns), count: rows)
            for bomb in bombs {
                if bomb.x < grid.count && bomb.y < grid[bomb.x].count {
                    grid[bomb.x][bomb.y] = false
                }
            }
            self.field = grid
        } else {
            let grid = Array(repeating: Array(repeating: true, count: self.columns), count: rows)
            self.field = grid
        }
    }
    
    func createBomb() -> [CoordField] {
        var bombs = [CoordField]()
        for i in 0 ... rows - 1 {
            for j in 0 ... columns - 1 {
                if field[i][j] == false {
                    bombs.append(CoordField(x: i, y: j))
                }
            }
        }
        return bombs
    }
    
    func clearField(){
        bombs.removeAll()
        createField()
//        self.game.field = [[GameCell]]()
//        self.game.bombs = [CoordField]()
    }
    
    private func config() {
        if let gameField = gameField {
            self.rows = gameField.rows
            self.columns = gameField.columns
            for bomb in gameField.bombs {
                bombs.append(bomb)
            }
        }
    }
    
    func isValid() -> Bool {
        let notViledFieldOne = Array(repeating: Array(repeating: true, count: self.columns), count: rows)
        let notViledFieldTwo = Array(repeating: Array(repeating: false, count: self.columns), count: rows)
        switch self.field{
        case notViledFieldOne:
            return false
        case notViledFieldTwo:
            return false
        default:
            return true
        }
    }
}
