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
        ZStack {
            Color(hex: "#e9e0d3").ignoresSafeArea(edges: .all)
            VStack(spacing: 40) {
                Spacer()
                Text("Minesweeper")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(Color(hex: "#3B2F2A"))
                    .shadow(radius: 5, x: 0, y: 5)
                VStack(spacing: 25) {
                    MenuButtonView(text: "Play", image: Image(systemName: "flag.fill")){
                        coordinator.next(.preGame)
                    }
                    MenuButtonView(text: "My fields", image: Image(systemName: "square.split.2x2.fill")){
                        coordinator.next(.preSavedGame)
                    }
                    MenuButtonView(text: "Create field", image: Image(systemName: "rectangle.checkered")){
                        coordinator.next(.create)
                    }
                    MenuButtonView(text: "Settings", image: Image(systemName: "gearshape.fill")){
                        coordinator.next(.create)
                    }
                    
                }
                Spacer()
            }
        }
    }
}

#Preview {
    MenuView()
}
