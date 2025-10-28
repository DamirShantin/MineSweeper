//
//  GameCellView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation
import SwiftUI

struct GameCellView: View {
    @Binding var isActive: Bool
    @Binding var value: Int
    @Binding var isMarked: Bool
    
    var clickAction: () -> Void
    var markAction: () -> Void
    
    var nonActiveColor: Color = .gray
    
    var param: CGFloat {
        let param = UIScreen.main.bounds.width / 10
        return param
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(isActive ? Color(hex: "#D8C3A5") : Color(hex: "#E6D9C8"))
                .frame(width: param, height: param)
                .overlay (
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(hex: "#CBB094"), lineWidth: 2)
                )
            
            if isActive {
                if value == -1{
                    Image("bomb")
                        .resizable()
                        .scaledToFit()
                        .padding(6)
                        .frame(width: param, height: param)
                } else if value == -2 {
                    Text("")
                } else {
                    Text("\(value)")
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                        .foregroundStyle(colorForNumber(value))
                }
            }
            
            if isMarked {
                Image("flag") // expects asset named "flag"
                    .resizable()
                    .scaledToFit()
                    .padding(8)
                    .frame(width: param, height: param)
            }
                
        }
        .onTapGesture {
            clickAction()
        }
        .onLongPressGesture {
            markAction()
        }

    }
    
    private func colorForNumber(_ number: Int) -> Color {
        switch number {
        case 1: return Color(hex: "#3B6EA5")
        case 2: return Color(hex: "#4B8A4A")
        case 3: return Color(hex: "#A83B3B")
        default: return Color(hex: "#3B2F2A")
        }
    }
    
}
#Preview {
    GameCellView(isActive: .constant(true), value: .constant(-1), isMarked: .constant(false )){
        //
    } markAction:{
        //
    }
}
