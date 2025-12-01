//
//  GameMineSweeper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation

final class NormalGameMineSweeper: GameProtocol {
    
    var gameLogic: GameLogicMineSweeperProtocol
    var demention: CoordField
    var rows: Int
    var columns: Int
    
    var field: [[GameCell]]{
        get {
            return curentField
        }
    }
    var gameStatus: GameStatus {
        get {
            gameLogic.gameStatus
        }
    }
    
    private var curentField = [[GameCell]]()
    
    init(gameLogic: GameLogicMineSweeperProtocol, demention: CoordField) {
        self.gameLogic = gameLogic
        self.demention = demention
        self.rows = demention.x
        self.columns = demention.y
        start()
    }

    //MARK: Methods
    
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
