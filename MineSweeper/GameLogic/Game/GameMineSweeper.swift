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
    var nameOfSave: String = ""
    
    init(storage: StorageModel, gameLogic: GameLogicMineSweeper) {
        self.storage = storage
        self.gameLogic = gameLogic
    }
    
    func start() {
        guard let field = storage.fetchData(name: nameOfSave) else { return }
        gameLogic.field = field
    }
    
    func end() {
        //
    }
    
    func pause() {
        //
    }
    
    
}
