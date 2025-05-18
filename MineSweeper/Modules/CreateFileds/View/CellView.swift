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
    var param: CGFloat {
        let param = UIScreen.main.bounds.width / 21
        return param
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(isActive ? Color.gray : Color.red)
            .frame(width: param, height: param)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
    }
}

//#Preview {
//    CellView(isActive: .constant(true))
//}
