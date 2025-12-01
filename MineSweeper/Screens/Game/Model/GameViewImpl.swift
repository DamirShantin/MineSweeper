//
//  GameViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation
import SwiftUI

struct GameViewImpl: View {
    var demention: CoordField
    
    func createVM() -> GameViewModel {
        let logic = NormalGameLogicMineSweeper()
        let game = NormalGameMineSweeper(gameLogic: logic, demention: demention)
        return GameViewModel(game: game, demention: demention)
    }
    
    var body: some View {
        GameView(vm: createVM())
    }
}
