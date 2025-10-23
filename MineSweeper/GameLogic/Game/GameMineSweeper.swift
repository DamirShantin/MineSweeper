//
//  GameMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation

final class GameMineSweeper: GameProtocol {
    
    var gameLogic: GameLogicMineSweeperProtocol
    
    init(gameLogic: GameLogicMineSweeperProtocol) {
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
    
    var rows: Int {
        get {
            Coordinator.shared.demention!.x
        }
    }
    
    var columns: Int {
        get {
            Coordinator.shared.demention!.y
        }
    }
    
    func start() {
        let newField = gameLogic.createMineSweeper(bombs: [], rows: rows, columns: columns)
        curentField = newField
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
