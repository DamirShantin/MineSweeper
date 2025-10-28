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
    
    private var isRunningTimer: Bool = false
    private var timer: Timer?
    var rows: Int
    var columns: Int
    var countMines: Int
    
    var game : GameMineSweeper
    
    init(game: GameMineSweeper) {
        self.game = game
        self.rows = Coordinator.shared.demention!.x
        self.columns = Coordinator.shared.demention!.y
        self.countMines = MineCountService().createNumbersOfBombs(rows: rows, columns: columns)
        start()
    }
    
    deinit{
        stopTimer()
        print("deinit GameViewModel")
    }
    var timeString: String {
        let m = counterTimer / 60
        let s = counterTimer % 60
        return String(format: "%02d:%02d", m, s)
    }
    
    
    // MARK: Game logic
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
        if game.gameStatus == .lose {
            lose()
        }
    }
    
    func marked(row: Int, column: Int) {
        self.game.makred(row: row, column: column)
        updateField()
        if game.gameStatus == .win {
            win()
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
        
        if isRunningTimer == true {
            stopTimer()
        }
    }
    
    func win(){
        stopTimer()
        
    }
    
    // MARK: Timer
    private func startTimer() {
        print("таймер пошел")
        self.counterTimer = 0
        isRunningTimer = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.counterTimer += 1
            
            guard let self else { return }
            RunLoop.main.add(self.timer!, forMode: .common)
        }
    }
    private func stopTimer() {
        isRunningTimer = false
        timer?.invalidate()
        timer = nil
    }
    private func resetTimer() {
        counterTimer = 0
    }
}
