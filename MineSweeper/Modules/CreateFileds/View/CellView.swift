//
//  CellView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 12.05.2025.
//

import SwiftUI

enum StateCell {
    case bomb, notBomb
}

struct CellView: View {
    
//    @Binding var isBomb: StateCell
    @Binding var isActive: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(isActive ? Color.gray : Color.red)
            .frame(width: 20, height: 20)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
    }
}

//#Preview {
//    CellView(isActive: .constant(true))
//}
