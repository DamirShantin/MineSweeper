//
//  SliderView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 10.11.2025.
//

import SwiftUI

struct HorSliderView: View {
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
    var range: RangeWrapper
    
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
                                .padding(.all, 4)
                            
                            
                        }
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: xPosition)
                        .shadow(radius: 2)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { gesture in
                                    let newX = min(max(0, gesture.location.x - thumbSize / 2), width)
                                    let newValue = range.lowerBound + (newX / width) * (range.upperBound - range.lowerBound)
                                    self.value = Float(newValue)
                                }
                        )
                    }
                    .frame(height: max(thumbSize, trackHeight))
                }
                .frame(width: 250 ,height: thumbSize)
            }
        }
        
    }
}


//#Preview {
//    SliderView(imageOnSlider: Image("bomb"))
//}


