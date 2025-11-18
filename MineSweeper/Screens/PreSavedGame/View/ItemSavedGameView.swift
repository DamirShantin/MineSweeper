//
//  ItemSavedGameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 18.11.2025.
//

import SwiftUI

struct ItemSavedGameView: View {
    
    @Binding var selectedField: String
    
    var field: Field
    
    var sizeField: String {
        let sizeString = "\(field.rows) x \(field.columns)"
        return sizeString
    }
    
    var action: (String) -> Void
//    var name: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(field.name)")
                    .bold()
                    .font(.system(size: 28))
                    .lineLimit(2)
                Text(sizeField)
                    .font(.system(size: 21))
                    .fontWeight(.semibold)
                Text("\(field.bombs.count) mines")
                    .font(.system(size: 21))
                    .fontWeight(.semibold)
                
            }
            .foregroundStyle(Color(hex: "#efcc8e"))
            .padding(.leading, 9)
            
            Spacer()
        }
        .frame(width: 270, height: 150)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(selectedField == field.name ? Color.black : Color(hex: "#7d3f14"), lineWidth: 5)
            
        )
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(hex: "#7d3f14"))
        )
        .frame(width: 270, height: 150)
        .onTapGesture {
            action(field.name)
        }
    }
}

//#Preview {
//    ItemSavedGameView(){ name in
//    //
//    }
//}
