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
    var param: CGFloat {
        let param = UIScreen.main.bounds.width / 21
        return param
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(isActive ? Color.green : Color.red)
            .frame(width: param, height: param)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
    }
}
