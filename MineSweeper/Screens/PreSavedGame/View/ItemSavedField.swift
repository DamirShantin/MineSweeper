//
//  ItemSavedField.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 15.03.2026.
//


import SwiftUI

struct ItemSavedField: View {
    
    @Binding var selectedField: GameField
    @State private var isLike: Bool = false
    
    var field: GameField
    
    var action: (GameField) -> Void
    var delete: (String) -> ()
    var detail: (String) -> ()
    
    var body: some View {
        ZStack {
            Color(hex: "#e9e0d3").ignoresSafeArea(edges: .all)
            
            HStack {
                Button {
                    isLike.toggle()
                } label: {
                    Image(systemName: isLike ? "star.fill" : "star")
                        .foregroundColor(isLike ? Color.yellow : Color.black)
                }
                
                Text(field.name)
                    .font(.system(size: 21))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Spacer()
                
                Button{
                    Coordinator.shared.popup(.detailField(field: field))
                } label: {
                    Text("view")
                        .font(.system(size: 16))
                        .foregroundStyle(.black)
                        .frame(width: 50, height: 20)
                        .background(
                            Capsule()
                                .fill(.gray)
                            
                        )
                }
                .zIndex(100)
            }
            .frame(width: 330, height: 50)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(selectedField.id == field.id ? Color.black : Color.clear, lineWidth: 2)
                )
            .onTapGesture {action(field) }
            
        }
    }
}
