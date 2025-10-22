//
//  GameViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation
import SwiftUI

struct GameViewImpl: View {
    func createVM() -> GameViewModel {
        let logic = NormalGameLogicMineSweeper()
        let game = GameMineSweeper(gameLogic: logic)
        return GameViewModel(game: game)
    }
    
    var body: some View {
        GameView(vm: createVM())
    }
}
