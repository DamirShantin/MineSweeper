//
//  CreateFieldsViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 12.05.2025.
//

import Foundation

class CreateFieldsViewModel: ObservableObject {
    @Published var field = [[Bool]]()
    
    var game = GameLogicMineSweeper()
    
    var rows: Int
    var columns: Int
    
    init(){
        print("init create")
        self.rows = 10
        self.columns = 10
        createField()
        
    }
    
    func createField() {
        let grid = Array(repeating: Array(repeating: true, count: self.columns), count: rows)
        self.field = grid
        print("\(rows) X \(columns)")
    }
    
    func createBomb() {
        for i in 0 ... rows - 1 {
            for j in 0 ... columns - 1 {
                if field[i][j] == false {
                    self.game.bombs.append([i,j])
                }
            }
        }
    }
    
    func clearField(){
        self.game.field = [[Int]]()
        self.game.bombs = [[Int]]()
    }
    
    func createMineSweeperField() {
        game.createMineSweeper(bombs: game.bombs, rows: rows, columns: columns)
        
    }
}
