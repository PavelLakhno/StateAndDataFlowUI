//
//  StorageManager.swift
//  StateAndDataFlowUI
//
//  Created by Павел Лахно on 17.12.2022.
//

import SwiftUI

class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData = userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        guard let user = user else { return User() }
        return user
    }
    
    func isRegistered() -> Bool {
        !fetchUser().name.isEmpty
    }
    
    func removeFrom(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegistered = false
        userData = nil
    }
}
