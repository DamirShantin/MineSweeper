//
//  GameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.05.2025.
//

import SwiftUI

struct PreSavedGameView: View {
    @StateObject var vm: PreSavedGameViewModel
    
    @State private var selected: String = ""
    @State private var showSaves: Bool = false
    
    
    var body: some View {
        ZStack {
            Color(hex: "#e9e0d3").ignoresSafeArea(edges: .all)
            VStack(spacing: 20) {
                Spacer()
                
                Text("Saved Games")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(Color(hex: "#3B2F2A"))
                    .shadow(radius: 5, x: 0, y: 5)
                    .padding(.bottom, 50)
                
                SliderAndScrollView(vm: vm, selectField: $selected)
                    .frame(height: 400)
                    .padding(.vertical, 10)
                
                Spacer()
                StartGameButton(text: "Start") {
                    vm.storage.selectedField = selected
                    Coordinator.shared.next(.savedGame)
                }                
                .disabled(selected == "")
                .padding(.bottom, 40)
                
            }
        }
    }
}


//#Preview {
//    var storage = MockDataStogare()
//    @StateObject var vm = PreGameViewModel(storage: storage)
//    return PreGameView(vm: vm)
//}
