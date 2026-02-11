//
//  StartGameButton.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.11.2025.
//

import SwiftUI

struct StartGameButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button { action() }
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 250, height: 60)
                    .foregroundColor(Color(hex: "#d6c3ab"))
                    .shadow(radius: 2, x: 0, y: 2)
                Text(text)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(hex: "#503e30"))
            }
        }
    }
}

//#Preview {
//    StartGameButton()
//}
