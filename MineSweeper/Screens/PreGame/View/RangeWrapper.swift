//
//  RangeWrapper.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.11.2025.
//
import SwiftUI

struct RangeWrapper {
    private var range: ClosedRange<CGFloat>
    
    init(lower: CGFloat, upper: CGFloat) {
        self.range = lower...upper
    }
    
    // MARK: - CGFloat
    
    var lowerBound: CGFloat {
        get { range.lowerBound }
        set { range = newValue...range.upperBound }
    }
    
    var upperBound: CGFloat {
        get { range.upperBound }
        set { range = range.lowerBound...newValue }
    }
    
    func contains(_ value: CGFloat) -> Bool {
        range.contains(value)
    }
    
    func clamp(_ value: CGFloat) -> CGFloat {
        min(max(value, range.lowerBound), range.upperBound)
    }
    
    // MARK: - Int
    
    var lowerBoundInt: Int {
        get { Int(range.lowerBound) }
        set { range = CGFloat(newValue)...range.upperBound }
    }
    
    var upperBoundInt: Int {
        get { Int(range.upperBound) }
        set { range = range.lowerBound...CGFloat(newValue) }
    }
    
    func contains(_ value: Int) -> Bool {
        range.contains(CGFloat(value))
    }
    
    func clamp(_ value: Int) -> Int {
        Int(clamp(CGFloat(value)))
    }
}
