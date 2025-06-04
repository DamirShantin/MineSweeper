//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var field = [[GameCell]]()
    
    var game : GameMineSweeper 
//    {
//        let storage = StorageService.shared.storage
//        let gameLogic = GameLogicMineSweeper()
//        let game = GameMineSweeper(storage: storage, gameLogic: gameLogic)
//        return game
//    }
    
    init(game: GameMineSweeper) {
        self.game = game
        start()

    }
    
//    init(){
//        start()
//    }
    
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
        print("\(row) X \(column)")
        print(game.field[row][column].clicked ? "+" : "-")
        game.field.map { array in
            print(array)
        }
        
    }
    
    lazy var storage: StorageModel = {
        return game.storage
    }()
    
    lazy var selectedField: String = {
        guard let name = storage.selectedField else { return "" }
        return name
    }()
    
    lazy var rows: Int = {
        let rows = storage.fetchData(name: selectedField)?.count
        return rows ?? 0
    }()
    
    lazy var columns: Int = {
        let columns = storage.fetchData(name: selectedField)?.first?.count
        return columns ?? 0
    }()
    
    
}
