//
//  GameFieldView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 26.10.2025.
//

import Foundation
import SwiftUI

struct ScrolingGameFieldView< Content: View>: View {
    @State private var offset: CGSize = .zero
    @State private var lastDrag: CGSize = .zero
    
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    @State private var isActive: Bool = true
    
    var content: Content
    let rows: Int
    let columns: Int
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping () -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content()
    }
    
    // Размер поля
    private var fieldSizeWidth: CGFloat{
        let widthOne = CGFloat(width / 10)
        let width = widthOne * CGFloat(columns)
        return width
    }
    private var fieldSizeHigh: CGFloat{
        let widthOne = CGFloat(width / 10)
        let width = widthOne * CGFloat(rows)
        return width
    }
    
    private var width = UIScreen.main.bounds.width
    private var high = UIScreen.main.bounds.height - 140
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                
                ZStack {
                    Color.clear.frame(maxWidth: .infinity, maxHeight: .infinity)
                    content
                        .disabled(!isActive)
                }
                .scaleEffect(scale)
                .offset(x: offset.width, y: offset.height)
                .gesture(
                    SimultaneousGesture(
                        DragGesture()
                            .onChanged { value in
                                guard (fieldSizeWidth * scale) > width || (fieldSizeHigh * scale) > high else { return }
                                self.isActive = false
                                // Ограничение смещения
                                let maxX = (fieldSizeWidth * scale - screenWidth) / 2
                                let maxY = (fieldSizeHigh * scale - screenHeight) / 2
                                
                                if fieldSizeHigh * scale > high && fieldSizeWidth * scale <= width {
                                    let newOffset = CGSize(width: 0,height: lastDrag.height + value.translation.height)
                                    offset.width = 0
                                    offset.height = min(max(newOffset.height, -maxY), maxY)
                                } else if fieldSizeWidth * scale > width && fieldSizeHigh * scale <= high{
                                    let newOffset = CGSize(width: lastDrag.width + value.translation.width, height: 0)
                                    offset.width = min(max(newOffset.width, -maxX), maxX)
                                    offset.height = 0
                                } else {
                                    let newOffset = CGSize(
                                        width: lastDrag.width + value.translation.width,
                                        height: lastDrag.height + value.translation.height
                                    )
                                    offset.width = min(max(newOffset.width, -maxX), maxX)
                                    offset.height = min(max(newOffset.height, -maxY), maxY)
                                }
                                
                            }
                            .onEnded { _ in
                                self.isActive = true
                                lastDrag = offset
                            },
                        MagnificationGesture()
                            .onChanged { value in
                                self.isActive = false

                                if fieldSizeWidth > width && fieldSizeHigh > high {
                                    let minScale = width / fieldSizeWidth
                                    
                                    if lastScale * value > 2 {
                                        scale = 2
                                    } else if lastScale * value < minScale {
                                        scale = minScale
                                    } else {
                                        scale = lastScale * value
                                    }
                                    
                                } else {
                                    let minScaleHigh = high / fieldSizeHigh
                                    let minScaleWidht = width / fieldSizeWidth
                                    let max = max(minScaleHigh, minScaleWidht)
                                    if lastScale * value >= max {
                                        scale = max
                                    } else if lastScale * value <= 1 {
                                        scale = 1
                                    } else {
                                        scale = lastScale * value
                                    }
                                }
                                let maxX = max((fieldSizeWidth * scale - screenWidth) / 2, 0)
                                let maxY = max((fieldSizeHigh * scale - screenHeight) / 2, 0)
                                
                                offset.width = min(max(offset.width, -maxX), maxX)
                                offset.height = min(max(offset.height, -maxY), maxY)
                            }
                            .onEnded { _ in
                                self.isActive = true
                                lastScale = scale
                            }
                    )
                )
                .frame(width: screenWidth, height: screenHeight)
                .clipped()
            }
        }
    }
}
