//
//  GameLogicMineSweeperProtocol.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 22.10.2025.
//


protocol GameLogicMineSweeperProtocol {
    var field: [[GameCell]] {get set}
    var bombs: [CoordField] {get set}
    var checkBombs: [CoordField] {get set}
    var gameStatus: GameStatus {get set}
    
    func createMineSweeper(bombs: [CoordField], rows: Int, columns: Int) -> [[GameCell]]
    func click(field: [[GameCell]], givenI: Int, givenJ: Int) -> [[GameCell]]
    func marked(field: [[GameCell]], givenI: Int, givenJ: Int) -> [[GameCell]]
    func lose() -> [CoordField]
}

