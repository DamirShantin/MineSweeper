//
//  StorageService.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation

final class StorageService {
    static var shared = StorageService()
    private init() {}
    
    var storage: StorageModel {
        return CoreDataStorage.shared
    }
    
}
