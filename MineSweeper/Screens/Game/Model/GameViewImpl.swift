//
//  GameViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation
import SwiftUI

struct GameViewImpl: View {
    var gameField: GameField
    var type: GameTypes
    
    func createVM() -> GameViewModel {
        let logic = NormalGameLogicMineSweeper(gameType: type, gameField: gameField)
        let game = NormalGameMineSweeper(gameLogic: logic)
        return GameViewModel(game: game, gameField: gameField)
    }
    
    var body: some View {
        GameView(vm: createVM())
    }
}
