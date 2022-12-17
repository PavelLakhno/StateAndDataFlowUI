//
//  StorageManager.swift
//  StateAndDataFlowUI
//
//  Created by Павел Лахно on 17.12.2022.
//

import Foundation

class StorageManager {
    static let share = StorageManager()
    
    private let defaults = UserDefaults.standard
    private let nameKey = "name"
    
    private init() {}
    
    func save(name: String) {
        defaults.set(name, forKey: nameKey)
    }
    
    func fetchName() -> String {
        if let name = defaults.value(forKey: nameKey) as? String {
            return name
        }
        return ""
    }
    
    func isRegistered() -> Bool {
        !fetchName().isEmpty
    }
    
    func remove(name: String) {
        defaults.removeObject(forKey: name)
    }
}
