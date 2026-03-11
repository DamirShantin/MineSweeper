//
//  PreGameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation

final class PreGameViewModel: ObservableObject {
    
    var rows: Int = 4
    var columns: Int = 4
    var minesCount: Int = 0
    
    init(){
        countMines()
    }
    
    func countMines() {
        let countService = MineCountService()
        minesCount = countService.createNumbersOfBombs(rows: rows, columns: columns)
        
    }
    
    func startGame() {
        let gameField = GameField(name: "", rows: rows, columns: columns, bombs: [], id: "")
        Coordinator.shared.next(.game(gameField: gameField, type: .normal))
    }
}
