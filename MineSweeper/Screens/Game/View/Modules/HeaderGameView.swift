//
//  HeaderGameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 27.10.2025.
//

import SwiftUI

struct HeaderGameView: View {
    var gameStatus: GameStatus
    var countMines: Int
    var timeString: String
    
//    @StateObject var vm: GameViewModel //for testing
    
    var body: some View {
        VStack(alignment: .leading) {
            headerText()
            .padding(.vertical, 8)
            
            HStack(alignment: .center) {
                minesAndTime()
                Spacer()
                stateGame()
            }
            .padding(.horizontal)
            
        }        
    }
    
    @ViewBuilder
    private func headerText() -> some View {
        HStack {
            BackButtonView(){
                Coordinator.shared.back() // change
            }
            Spacer()
            Text("Minesweeper")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(hex: "#3B2F2A"))
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func minesAndTime() -> some View {
        VStack(alignment: .leading) {
            Text("Mines: \(countMines)")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#3B2F2A"))
            
            Text("Time: \(timeString)")
                .font(.system(.title2, design: .monospaced))
                .foregroundColor(Color(hex: "#3B2F2A"))
            
        }
    }
    
    @ViewBuilder
    private func stateGame() -> some View {
        if gameStatus == .lose {
            Text("You lose :(")
                .bold()
                .foregroundStyle(.red)
        } else if gameStatus == .win {
            Text("You win :)")
                .bold()
                .foregroundStyle(.green)
        } else {
            Text("🇰🇿")
                .bold()
                .foregroundStyle(.white)
        }
    }
    
//    @ViewBuilder
//    func testingButton() -> some View {
//        Button("Save") {
//            SingltonStorage.shared.saveData(name: "test", row: vm.rows, col: vm.columns, bombs: vm.game.gameLogic.bombs)
//        }
//    }
}
