//
//  SliderAndScrollView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 17.11.2025.
//

import SwiftUI

struct SliderAndScrollView: View {
    
    @StateObject var vm: PreSavedGameViewModel

    @State private var sliderValue: Float = 0
    @State private var currentIndex: Int = 0
    @State private var isDraggingSlider = false
    @Binding var selectField: Field
    
    var count: Int {
        return vm.fields.count
    }
    var range: RangeWrapper {
        return RangeWrapper(lower: 0, upper: CGFloat(count - 1))
    }
    
    var body: some View {
        HStack(spacing: 6) {
            //MARK: Scroll
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 5) {
                    ForEach(0..<count, id: \.self) { i in
                        ItemSavedGameView (selectedField: $selectField, field: vm.fields[i]) { field in selectField = field }
                        delete: { id in vm.deleteField(id: id) }
                        detail: { id in vm.detailField(id: id) }
                            .padding(.vertical, 6)
                    }
                }
            }
           
        }
        .padding(.horizontal, 10)
        .frame(height: 450, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width - 50, height: 480)
                .foregroundStyle(.blue.opacity(0.3))
                .shadow(radius: 10)
        )
    }
}

//#Preview {
//    SliderAndScrollView()
//}
