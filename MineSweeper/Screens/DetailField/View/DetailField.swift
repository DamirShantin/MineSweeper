//
//  DetailField.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 15.03.2026.
//


import SwiftUI

struct DetailField: View {
    
    var vm: DetailFieldViewModel
    
    init(vm: DetailFieldViewModel) {
        self.vm = vm
    }
    
    var body: some View {
            ZStack {
                Color(hex: "#e9e0d3").ignoresSafeArea(edges: .all)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                    .blur(radius: 4)
                VStack {
                    Spacer()
                    
                    Text(vm.field.name)
                        .font(.system(size: 21))
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top)
                    
                    
                    GridView(rows: vm.field.rows, columns: vm.field.columns, spacing: 0) { row, col in
                        DetailCellView(isBomb: vm.fieldView[row][col])
                    }
                    
                    
                    
                    Text("Size: \(vm.field.rows) x \(vm.field.columns)")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    
                    Text("Mines: \(vm.field.bombs.count)")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Text("Change")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 120, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "#d6c3ab"))
                            )
                    }
                    .padding(.bottom)
                    
                }
                .padding(.horizontal)
            }
            .onTapGesture { }
            .frame(maxWidth: UIScreen.main.bounds.width / 1.5, maxHeight: UIScreen.main.bounds.height / 2)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "#7d3f14"), lineWidth: 3)
            )
    }
}
