//
//  RegisterView.swift
//  StateAndDataFlowUI
//
//  Created by user on 16.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var color = Color.red
    @State private var isDisabled = true
    @EnvironmentObject private var userManager: UserManager
    @StateObject private var timer = TimeCounter()

    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .onChange(of: name) {_ in
                        checkName()
                    }
                    .multilineTextAlignment(.center)

                Text(name.count.formatted())
                    .foregroundColor(color)
            }
            .padding()
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(isDisabled)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isRegister.toggle()
            StorageManager.share.save(name: name)
        }
    }
    
    private func checkName() {
        if name.count > 2 {
            color = .green
            isDisabled = false
        } else {
            color = .red
            isDisabled = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
