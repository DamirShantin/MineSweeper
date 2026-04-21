//
//  GridView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 12.05.2025.
//

import SwiftUI

struct GridView<Content: View> : View {
    
    var rows: Int
    var columns: Int
    var spacing: CGFloat
    var content: (Int, Int) -> Content
    
    init(rows: Int, columns: Int, spacing: CGFloat, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.spacing = spacing
        self.content = content
    }
    
    
    var body: some View {
        VStack(spacing: 2) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 2){
                    ForEach(0..<columns, id: \.self) { col in
                        content(row, col)
                    }
                    
                }
            }
            
        }  
    }
}

//#Preview {
//    GridView()
//}
