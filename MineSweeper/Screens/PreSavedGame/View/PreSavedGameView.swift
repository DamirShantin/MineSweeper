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
        VStack {
            Spacer()
            VStack {
                
                Button ("Сохранения") {
                    self.showSaves = true
                    if selected == "" {
                        self.selected = vm.storage.namesOfFields.first ?? ""
                    }
                }
                .buttonStyle(.bordered)
                .sheet(isPresented: $showSaves) {
                    PickerModalView(selected: $selected, items: vm.storage.namesOfFields)
                }
            }
            
            Spacer()
            Button("Начать игру") {
                vm.storage.selectedField = selected
                Coordinator.shared.next(.savedGame)
            }
            .padding()
            .font(.system(size: 23))
            .foregroundStyle(.black)
            .background(.gray)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.bottom, 50)
            
        }
    }
}


//#Preview {
//    var storage = MockDataStogare()
//    @StateObject var vm = PreGameViewModel(storage: storage)
//    return PreGameView(vm: vm)
//}
