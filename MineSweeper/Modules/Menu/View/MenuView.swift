//
//  MenuView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.05.2025.
//

import SwiftUI

struct MenuView: View {
    @StateObject var coordinator = Coordinator.shared
    
    var body: some View {
        VStack {
            Button("Играть") { coordinator.next(.preGame)}
            Button("Создать поле") { coordinator.next(.create)}
            
        }
    }
}

#Preview {
    MenuView()
}
