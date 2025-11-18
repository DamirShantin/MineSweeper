//
//  BackButtonView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 28.10.2025.
//
import SwiftUI

struct BackButtonView: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .foregroundColor(.primary)
        }
        
    }
}
