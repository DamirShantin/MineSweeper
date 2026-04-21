//
//  CreateGameCellView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 21.04.2026.
//
import SwiftUI

struct CreateGameCellView: View {
    
    @Binding var isActive: Bool
    var param: CGFloat {
        let param = (UIScreen.main.bounds.width - 70) / 21
        return param
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(hex: "#E6D9C8"))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(hex: "#CBB094"), lineWidth: 1)
                )
            if !isActive {
                Image("bomb")
                    .resizable()
                    .scaledToFit()
                    .frame(width: param - 3, height: param - 3)
            }
        }
        .frame(width: param, height: param)
       
            
    }
}
