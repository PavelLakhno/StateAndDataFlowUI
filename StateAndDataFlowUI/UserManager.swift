//
//  UserManager.swift
//  StateAndDataFlowUI
//
//  Created by user on 16.12.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegister = StorageManager.share.isRegistered()
    var name = StorageManager.share.fetchName()
}
