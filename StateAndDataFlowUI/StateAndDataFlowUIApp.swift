//
//  StateAndDataFlowUIApp.swift
//  StateAndDataFlowUI
//
//  Created by user on 16.12.2022.
//

import SwiftUI

@main
struct StateAndDataFlowUIApp: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView().environmentObject(userManager)
        }
    }
}
