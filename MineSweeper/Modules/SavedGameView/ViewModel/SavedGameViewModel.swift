//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation

class SavedGameViewModel: ObservableObject {
    @Published var field = [[GameCell]]()
    
    var game : SavedGameMineSweeper
    
    init(game: SavedGameMineSweeper) {
        self.game = game
        start()

    }
    
    lazy var storage: StorageModel = {
        return game.storage
    }()
    
    lazy var selectedField: String = {
        guard let name = storage.selectedField else { return "" }
        return name
    }()
    
    lazy var rows: Int = {
        let field = storage.fetchData(name: selectedField)
        return field?.rows ?? 0
    }()
    
    lazy var columns: Int = {
        let field = storage.fetchData(name: selectedField)
        return field?.columns ?? 0
    }()
    
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
        let field = self.game.field
        self.field = field
    }
    
    func updateField(){
        let newfield = self.game.field
        self.field = newfield
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
