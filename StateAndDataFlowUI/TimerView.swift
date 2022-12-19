//
//  TimerView.swift
//  StateAndDataFlowUI
//
//  Created by user on 16.12.2022.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(title: timer.buttonTitle, color: .red) {
                timer.startTimer()
            }
            
            Spacer()
            
            ButtonView(title: "Logout", color: .blue) {
                StorageManager.shared.removeFrom(userManager: userManager)
            }
        }
    }
    
    private func removeUser() {
        StorageManager.shared.removeFrom(userManager: userManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserManager())
    }
}

