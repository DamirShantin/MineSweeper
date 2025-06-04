//
//  GameMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 01.06.2025.
//

import Foundation

class GameMineSweeper: GameProtocol {
    
    var storage: StorageModel
    var gameLogic: GameLogicMineSweeper
    
    init(storage: StorageModel, gameLogic: GameLogicMineSweeper) {
        self.storage = storage
        self.gameLogic = gameLogic
        start()
    }
    // конфликт наблюдателя и инита
    
    var field: [[GameCell]]{
        get {
            return curentField
        }
    }
    
    var curentField = [[GameCell]]()
    
    func start() {
        guard let name = storage.selectedField else { return }
        guard let field = storage.fetchData(name: name) else { return }
        self.curentField = field
//        gameLogic.field = field
    }
    
    func end() {
        //
    }
    
    func pause() {
        //
    }
    
    // поле есть
    func click(row: Int, column: Int)  {
//        guard let field else { return }
        let newField = gameLogic.click(field: field, givenI: row, givenJ: column)
        
        newField.map { array in
            print(array)
        }
        self.curentField = newField
//        self.gameLogic.field = newField
    }
    
    
}
