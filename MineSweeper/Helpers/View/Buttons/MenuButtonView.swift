//
//  MenuButtonView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 10.11.2025.
//

import Foundation
import SwiftUI

struct MenuButtonView: View {
    var text: String
    var image: Image
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 250, height: 60)
                    .foregroundColor(Color(hex: "#d6c3ab"))
                    .shadow(radius: 4, x: 0, y: 2)
                HStack(spacing: 20) {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 30)
                    Text(text)
                        .font(.system(size: 24, weight: .bold))
                        .lineLimit(1)
                    
                }
                .foregroundColor(Color(hex: "#503e30"))
            }
        }
    }
}

#Preview {
    MenuButtonView(text: "Play", image: Image(systemName: "rectangle.checkered")){
        //
    }
}
