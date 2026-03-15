//
//  MiniFieldDetailVM.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 15.03.2026.
//


import Foundation

final class DetailFieldViewModel {
    var field: GameField
    var fieldView = [[Bool]]()
    
    init(field: GameField) {
        self.field = field
//        createMokeFieldView()
        createFieldView()
    }
    
    private func createFieldView() {
        var newField = Array(repeating: Array(repeating: false, count: field.columns), count: field.rows)
        for bomb in field.bombs {
            newField[bomb.x][bomb.y] = true
        }
        fieldView = newField
        
    }
    
    private func createMokeFieldView() {
        let newField = [[false, false, true, false],
        [false, false, true, false],
        [false, false, true, false],
        [false, false, true, false]]
        
        fieldView = newField
    }
    
    
}
