//
//  GameMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 01.06.2025.
//

import Foundation

class SavedGameMineSweeper: GameProtocol {
    
    
    var storage: StorageModel
    var gameLogic: GameLogicMineSweeperProtocol
    
    init(storage: StorageModel, gameLogic: GameLogicMineSweeperProtocol) {
        self.storage = storage
        self.gameLogic = gameLogic
        start()
    }

    var field: [[GameCell]]{
        get {
            return curentField
        }
    }
    
    var curentField = [[GameCell]]()
    
    var gameStatus: GameStatus {
        get {
            gameLogic.gameStatus
        }
    }
    
    func start() {
        guard let name = storage.selectedField else { return }
        guard let field = storage.fetchData(name: name) else { return }
        let newField = gameLogic.createMineSweeper(bombs: field.bombs, rows: field.rows, columns: field.columns)
        self.curentField = newField
//        self.curentBombs = bombs
        self.gameLogic.bombs = field.bombs
    }
    
    func end() {
        switch gameStatus {
        case .game:
            break
        case .win:
            print("==================")
            print("You win")
            print("==================")
        case .lose:
            print("==================")
            print("You lose")
            print("==================")
        case .pause:
            break
        case .start:
            break
        }
    }
    
    func pause() {
        //
    }
    
    func checkStatus() {
        if gameStatus != .game{
            end()
        }
    }
    
    func click(row: Int, column: Int)  {
        let newField = gameLogic.click(field: field, givenI: row, givenJ: column)
        self.curentField = newField
        checkStatus()
    }
    
    func makred(row: Int, column: Int){
        let newField = gameLogic.marked(field: field, givenI: row, givenJ: column)
        self.curentField = newField
        checkStatus()
    }
    
    func lose() -> [CoordField]{
        let difference = gameLogic.lose()
        return difference
    }
    
}
