//
//  SliderAndTextFieldView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.11.2025.
//

import SwiftUI

struct SliderAndTextFieldView: View {
    @Binding var value: Int
    @Binding var textValue: String
    var imageOnSlider: Image
    var thumbSize: CGFloat
    var accentColor: Color
    var sliderColor: Color
    var range: RangeWrapper
    var body: some View {
        
        HStack(alignment: .center, spacing: 20){
            SliderView(value: Binding(
                get: { Float(value) },
                set: { newVal in
                    value = Int(newVal)
                    textValue = String(value)
                }
            ),
                       imageOnSlider: imageOnSlider,
                       thumbSize: thumbSize,
                       accentColor: accentColor,
                       sliderColor: sliderColor,
                       range: range)
            
            TextField("", text: $textValue)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(width: 70)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.secondarySystemBackground))
                )
                .onChange(of: textValue) {
                    validateAndSync(textValue)
                }
        }
    }
    
    private func validateAndSync(_ text: String) {
        let filtered = text.filter { $0.isNumber }
        
        if filtered != text {
            textValue = filtered
        }
        
        if let num = Int(filtered) {
            if range.contains(num) {
                value = num
            } else {
                value = min(max(num, range.lowerBoundInt), range.upperBoundInt)
                textValue = String(value)
            }
        } else if !filtered.isEmpty {
            //
        } else {
            //
        }
    }
}
//#Preview {
//    SliderAndTextFieldView()
//}
