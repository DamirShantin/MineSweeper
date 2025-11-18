//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation

class SavedGameViewModel: ObservableObject {
    @Published var field = [[GameCell]]()
    
    @Published var counterTimer: Int = 0
    @Published var isRunningTimer: Bool = false
    private var timer: Timer?
    
    var game : SavedGameMineSweeper
    var storage: StorageModel
    
    init(game: SavedGameMineSweeper) {
        self.game = game
        self.storage = game.storage
        start()

    }
    
    lazy var selectedField: String = { // change
        guard let name = storage.selectedField else { return "" }
        return name
    }()
    
    lazy var rows: Int = { // change
        let field = storage.fetchData(name: selectedField)
        return field?.rows ?? 0
    }()
    
    lazy var columns: Int = { // change
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
        if game.gameStatus == .lose {
            lose()
        }
    }
    
    func marked(row: Int, column: Int) {
        self.game.makred(row: row, column: column)
        updateField()
        if game.gameStatus == .win {
            print("win")
        }
    }
    
    func lose(){
        if game.gameStatus != .lose {
            game.gameLogic.gameStatus = .lose
        }
        let difference = game.lose()
        var newField = self.field
        for i in difference {
            newField[i.x][i.y].clicked = true
        }
        self.field = newField
        Coordinator.shared.back() // for test
    }
    
        func startTimer() {
            guard !isRunningTimer else { return }
            isRunningTimer = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.counterTimer -= 1
                if self?.counterTimer == 0 {
                    self?.stopTimer()
                    self?.lose()
                }
            }
        }

        func stopTimer() {
            isRunningTimer = false
            timer?.invalidate()
            timer = nil
        }

        func resetTimer() {
            counterTimer = 120
        }
}
