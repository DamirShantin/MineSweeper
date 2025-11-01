//
//  SwipeRightViewModifaer.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 28.10.2025.
//

import SwiftUI

struct SwipeRightViewModifier: ViewModifier {
    var edgeWidth: CGFloat        // ширина активной зоны слева
    var threshold: CGFloat        // насколько далеко нужно провести, чтобы сработало
    var onSwipeRight: () -> Void

    @State private var isActive = false

    func body(content: Content) -> some View {
        content
            .contentShape(Rectangle()) // чтобы ловить жест по всей области
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // активируем свайп только если начало касания в левой части экрана
                        if value.startLocation.x < edgeWidth {
                            isActive = true
                        }
                    }
                    .onEnded { value in
                        if isActive {
                            if value.translation.width > threshold {
                                onSwipeRight()
                            }
                            withAnimation(.spring()) {
                                isActive = false
                            }
                        }
                    }
            )
    }
}

extension View {
    func edgeSwipeRight(
        edgeWidth: CGFloat = 10,
        threshold: CGFloat = 20,
        onSwipeRight: @escaping () -> Void
    ) -> some View {
        self.modifier(SwipeRightViewModifier(
            edgeWidth: edgeWidth,
            threshold: threshold,
            onSwipeRight: onSwipeRight
        ))
    }
}
