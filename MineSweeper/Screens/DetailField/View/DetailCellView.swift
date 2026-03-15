//
//  CreateCellView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 15.03.2026.
//


import SwiftUI


struct DetailCellView: View {
    
//    @Binding var isBomb: StateCell
    var isBomb: Bool
    
    init(isBomb: Bool) {
        self.isBomb = isBomb
    }
    
    var param: CGFloat {
        let param = UIScreen.main.bounds.width / 21 / 2
        return param
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(isBomb ? Color.red : Color.gray)
            .frame(width: param, height: param)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.black, lineWidth: 1)
            )
            
    }
}
