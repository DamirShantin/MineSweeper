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
    
    var game = SavedGameLogicMineSweeper()
    var numberOfBombs = MineCountService() // test
    
    var rows: Int
    var columns: Int
    
    init(){
        self.rows = 4
        self.columns = 4
        createField()
        
    }
    
    func numberOfBombsInField() { // test
        let count = numberOfBombs.createNumbersOfBombs(rows: rows, columns: columns)
            countBombs = count  
    }
    
    func createField() {
        let grid = Array(repeating: Array(repeating: true, count: self.columns), count: rows)
        self.field = grid
    }
    
    func createBomb() {
        for i in 0 ... rows - 1 {
            for j in 0 ... columns - 1 {
                if field[i][j] == false {
                    self.game.bombs.append(CoordField(x: i, y: j))
                }
            }
        }
    }
    
    func clearField(){
        self.game.field = [[GameCell]]()
        self.game.bombs = [CoordField]()
    }
    
//    func createMineSweeperField() {
//        game.createMineSweeper(bombs: game.bombs, rows: rows, columns: columns)
//        
//    }
    
    func createNameField(name: String) -> String {
        return "\(self.rows) x \(self.columns) " + name
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
