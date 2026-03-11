//
//  Coordinator.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.05.2025.
//

import Foundation
import SwiftUI

final class Coordinator: ObservableObject {
    static var shared = Coordinator()
    
    @Published var path = [Step]()
    
    enum Step: Hashable {
        case  preSavedGame, create(field: GameField?), preGame, game(gameField: GameField, type: GameTypes)
        var view: some View {
            NavigationView{
                Group {
                    switch self {
                    case .preSavedGame: PreSavedGameViewImpl()
                    case .create(let field): CreateViewImpl(field: field)
                    case .preGame: PreGameViewImpl()
                    case .game(let gameField, let type): GameViewImpl(gameField: gameField, type: type)
                    }
                }
                .edgeSwipeRight { shared.back() }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func next(_ val: Step) {
        Task {
            await MainActor.run {
                path += [val]
            }
        }
    }
    
    func back(){
        Task{
            await MainActor.run {
                path.removeLast()
            }
        }
    }
    
}
