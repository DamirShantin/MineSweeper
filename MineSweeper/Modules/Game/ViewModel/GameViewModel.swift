//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation

final class GameViewModel: ObservableObject {
    @Published var field = [[GameCell]]()
    
    @Published var counterTimer: Int = 0
    @Published var isRunningTimer: Bool = false
    private var timer: Timer?
    
    var game : GameMineSweeper
    
    init(game: GameMineSweeper) {
        self.game = game
        start()
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
    
    var countMines: Int {
        get {
            MineCountService().createNumbersOfBombs(rows: rows, columns: columns)
        }
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
        if isRunningTimer == false {
            startTimer()
        }
    }
    
    func marked(row: Int, column: Int) {
        self.game.makred(row: row, column: column)
        updateField()
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
        
        if isRunningTimer == true {
            stopTimer()
        }
    }
    
    func win(){
        stopTimer()
    }
    
        private func startTimer() {
            print("таймер пошел")
            self.counterTimer = 120
            isRunningTimer = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.counterTimer -= 1
                if self?.counterTimer == 0 {
                    self?.stopTimer()
                    self?.lose()
                }
                RunLoop.main.add(self!.timer!, forMode: .common)
            }
        }

        private func stopTimer() {
            isRunningTimer = false
            timer?.invalidate()
            timer = nil
        }

        private func resetTimer() {
            counterTimer = 120
        }
}
