//
//  ItemSavedGameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 18.11.2025.
//

import SwiftUI

struct ItemSavedGameView: View {
    
    @Binding var selectedField: Field
    @State private var isLike: Bool = false
    
    var field: Field
    
    var sizeField: String {
        let sizeString = "\(field.rows) x \(field.columns)"
        return sizeString
    }
    
    var height: CGFloat = 150
    var heightButton: CGFloat {
        let heightButton: CGFloat = (height - 6) / 3
        return heightButton
    }
    
    var action: (Field) -> Void
    var delete: (String) -> ()
    var detail: (String) -> ()
    
    var body: some View {
        HStack {
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
            .frame(width: 270, height: height)
            .shadow(radius: 5, x: 1, y: 1)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedField.id == field.id ? Color.black : Color(hex: "#7d3f14"), lineWidth: 5)
                
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(hex: "#7d3f14"))
            )
            .frame(width: 270, height: height)
            .onTapGesture {
                action(field)
            }
            
            VStack(spacing: 5) {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(hex: "#7d3f14"))
                    .frame(width: heightButton, height: heightButton)
                    .overlay(
                        Image(systemName: isLike ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(isLike ? .red : .black)
                    )
                    .onTapGesture { isLike.toggle() }
                
                Button {
                    detail(field.id)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(hex: "#7d3f14"))
                        .frame(width: heightButton, height: heightButton)
                        .overlay(
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.black)
                            )
                }

                Button {
                    delete(field.id)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(hex: "#7d3f14"))
                        .frame(width: heightButton, height: heightButton)
                        .overlay(
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.black)
                            )
                }


            }
        }
    }
}

//#Preview {
//    ItemSavedGameView(){ name in
//    //
//    }
//}
