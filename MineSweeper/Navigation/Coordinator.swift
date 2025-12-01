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
        case savedGame, preSavedGame, create, preGame, game(demention: CoordField)
        var view: some View {
            NavigationView{
                Group {
                    switch self {
                    case .preSavedGame: PreSavedGameViewImpl()
                    case .create: CreateViewImpl()
                    case .savedGame: SavedGameViewImpl()
                    case .preGame: PreGameViewImpl()
                    case .game(let demention): GameViewImpl(demention: demention)
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
