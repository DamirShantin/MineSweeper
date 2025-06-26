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
    
    var nonActiveColor: Color = .gray
    
    var param: CGFloat {
        let param = UIScreen.main.bounds.width / 21
        return param
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(isActive ? Color.white : Color.gray)
            .frame(width: param, height: param)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .overlay {
                if isActive {
                    Text(value == -2 ? "" : "\(value)")
                        .foregroundStyle(.black)
                }
                
                if isMarked {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.black)
                        .frame(width: param, height: param)
                }
            }
            
            
    }
}
#Preview {
    return GameCellView(isActive: .constant(true), value: .constant(-2), isMarked: .constant(true))
}
