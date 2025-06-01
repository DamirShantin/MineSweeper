//
//  GameViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation
import SwiftUI

struct PreGameViewImpl: View {
    var storage = SingltonStorage.shared
    var vm = PreGameViewModel()
    var body: some View {
        PreGameView(vm: vm)
    }
}
