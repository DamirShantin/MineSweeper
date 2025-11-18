//
//  SliderAndScrollView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 17.11.2025.
//

import SwiftUI

// PreferenceKey для отслеживания ближайшего элемента
private struct ItemOffsetKey: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct SliderAndScrollView: View {
    
    @StateObject var vm: PreSavedGameViewModel

    @State private var sliderValue: Float = 0
    @State private var currentIndex: Int = 0
    @State private var isDraggingSlider = false
    @Binding var selectField: String
    
    var count: Int {
        return vm.fields.count
    }
    var range: RangeWrapper {
        return RangeWrapper(lower: 0, upper: CGFloat(count - 1))
    }
    
    var body: some View {
            HStack(spacing: 6) {

                //MARK: Scroll
                ScrollViewReader { proxy in
                    GeometryReader { outer in
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack(spacing: 20) {
                                ForEach(vm.fields.indices, id: \.self) { i in
                                    ItemSavedGameView (selectedField: $selectField, field: vm.fields[i]) { name in selectField = name }
                                        .background(
                                            GeometryReader { geo in
                                                let mid = geo.frame(in: .global).midY
                                                let screenMid = outer.frame(in: .global).midY
                                                
                                                let normalizedCount = screenMid / geo.size.height
                                                
                                                if i < Int(round(normalizedCount)) {
                                                    let distance = abs(mid - screenMid / 2)
                                                    Color.clear.preference(
                                                        key: ItemOffsetKey.self,
                                                        value: [i: distance]
                                                    )
                                                } else if i > count - Int(round(normalizedCount)) {
                                                    let distance = abs(mid - screenMid * 3 / 2)
                                                    Color.clear.preference(
                                                        key: ItemOffsetKey.self,
                                                        value: [i: distance]
                                                    )
                                                } else {
                                                    let distance = abs(mid - screenMid)
                                                    Color.clear.preference(
                                                        key: ItemOffsetKey.self,
                                                        value: [i: distance]
                                                    )
                                                }
                                            }
                                        )
                                        .id(i)
                                }
                            }
                        }
                        .onPreferenceChange(ItemOffsetKey.self) { values in
                            guard !isDraggingSlider else { return }
                            guard let nearest = values.min(by: { $0.value < $1.value })?.key else { return }
                            
                            let _ = values.map { if $0.key == 17 {print($0.key, $0.value)} else if $0.key == 18 {print($0.key, $0.value)} else if $0.key == 19 {print($0.key, $0.value)}  }

                            DispatchQueue.main.async {
                                currentIndex = nearest
                                sliderValue = Float(nearest)
                            }
                        }
                        .onChange(of: sliderValue) { value in
                            let idx = Int(round(value))
                            if idx != currentIndex {
//                                withAnimation(.easeInOut) {
                                    proxy.scrollTo(idx, anchor: .center)
//                                }
                                currentIndex = idx
                            }
                        }
                    }
                    
                }
                
                //MARK: Slider
                VerSliderView(value: $sliderValue, imageOnSlider: Image("flag"), thumbSize: 40, accentColor: Color.gray, sliderColor: Color(hex: "#915936"), range: range){ editing in
                    isDraggingSlider = editing

                    if !editing {
                        // Округляем и доводим
                        let idx = Int(round(sliderValue))
                        sliderValue = Float(idx)
                    }
                    
                }
                .frame(width: 70, height: 300)
//                .hidden(count < 3)
            }
            .padding(.horizontal, 10)
       
    }
}

//#Preview {
//    SliderAndScrollView()
//}
