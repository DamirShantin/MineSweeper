//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation

final class GameViewModel: ObservableObject {
    @Published var field = [[GameCell]]()
    
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
    
    var game : GameMineSweeper
    
    init(game: GameMineSweeper) {
        self.game = game
        start()

    }
    
    
    var alertLabel: String {
        switch game.gameStatus {
        case .game:
            return ""
        case .win:
            return "You win!!"
        case .lose:
            return "You lose ;("
        case .pause:
            return "Pause"
        case .start:
            return "Start"
        }
    }
    
    func start() {
        let newField = game.gameLogic.createMineSweeper(bombs:[] , rows: rows , columns: columns)
        self.field = newField
    }
    
    func updateField(){
        let newField = self.game.field
        self.field = newField
    }
    
    func click(row: Int, column: Int) {
        self.game.click(row: row, column: column)
        updateField()
    }
    
    func marked(row: Int, column: Int) {
        self.game.makred(row: row, column: column)
        updateField()
    }
}
