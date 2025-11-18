
//
//  SliderView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 10.11.2025.
//

import SwiftUI

struct VerSliderView: View {
    @Binding var value: Float
    
    var imageOnSlider: Image
    var thumbSize: CGFloat
    var trackHeight: CGFloat = 6
    var accentColor: Color
    var sliderColor: Color
    var nonAccentColor: Color = .gray
    
    // Color(hex: "#75784f")  // зеленный
    // Color(hex: "#915936") // коричневый
//    sliderColor: Color = Color(hex: "#D8C3A5")
    var step: CGFloat = 0.005
    var range: RangeWrapper
    var onChangeEditing: (Bool) -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                GeometryReader { geo in
                    // Вычисляем ширину и позицию ползунка
                    let width = geo.size.width - thumbSize
                    let progress = (CGFloat(value) - range.lowerBound) / (range.upperBound - range.lowerBound)
                    let xPosition = width * progress
                    
                    ZStack(alignment: .leading) {
                        // Трек
                        Capsule()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 3)
                        
                        // Заполненная часть
                        Capsule()
                            .fill(accentColor)
                            .frame(width: xPosition + thumbSize / 2, height: 4)
                        
                        // Ползунок
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(sliderColor)
                            imageOnSlider
                                .resizable()
                                .scaledToFill()
                                .rotationEffect(.degrees(-90))
                                .padding(4)
                            
                            
                        }
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: xPosition)
                        .shadow(radius: 2)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { gesture in
                                    onChangeEditing(true)
                                    
                                    let newX = min(max(0, gesture.location.x - thumbSize / 2), width)
                                    let newValue = range.lowerBound + (newX / width) * (range.upperBound - range.lowerBound)
                                    
                                    let vValue = stepToNearest(newValue)
                                    self.value = Float(vValue)
                                    
                                }
                                .onEnded { gesture in
                                    onChangeEditing(false)
//                                    let raw = valueFrom(location: gesture.location.x,
//                                                        totalWidth: width)
//                                    let newValue = clamp(stepToNearest(raw))
//                                    self.value = Float(newValue)
                                }
                        )
                    }
                    .frame(height: max(thumbSize, trackHeight))
                }
                .frame(width: 250 ,height: thumbSize)
            }
        }
        .rotationEffect(.degrees(90))
        
    }    
    /// приводит значение к ближайшему шагу
    private func stepToNearest(_ value: CGFloat) -> CGFloat {
        let rounded = (value / step).rounded() * step
        return rounded
    }
}


//#Preview {
//    VerSliderView(value: .constant(Float(1)), imageOnSlider: Image(""), thumbSize: 40, accentColor: Color(hex: "#915936"), sliderColor: Color(hex: "#75784f"), range: RangeWrapper(lower: 0, upper: 20))
//}


