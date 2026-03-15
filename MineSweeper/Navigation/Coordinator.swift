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
    @Published var popupRoute: PopupRoute?
    
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
    
    enum PopupRoute: Hashable {
        case detailField(field: GameField)
        
        var view: some View {
            switch self {
            case .detailField(field: let field): DetailFieldViewImpl(field: field)
            }
        }
    }
    
    func next(_ val: Step) {
        Task {
            await MainActor.run {
                self.popupRoute = nil
                path += [val]
            }
        }
    }
    
    func popup(_ val: PopupRoute) {
        Task {
            await MainActor.run {
                self.popupRoute = val
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
