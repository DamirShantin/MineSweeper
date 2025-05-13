//
//  GridView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 12.05.2025.
//

import SwiftUI

struct GridView: View {
    
    @StateObject var vm: CreateFieldsViewModel
    
    var rows: Int
    var columns: Int
    
    
    var body: some View {
        VStack {
            fieldOne(rows: rows, columns: columns)
        }

        
    }
    
    @ViewBuilder
    func fieldOne(rows: Int, columns: Int) -> some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0){
                    ForEach(0..<columns, id: \.self) { col in
                        CellView(isActive: $vm.field[row][col])
                            .onTapGesture {
                                vm.field[row][col].toggle()
                            }
                    }
                    
                }
            }
            
        }
    }
}

//#Preview {
//    GridView()
//}
