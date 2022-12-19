//
//  RegisterView.swift
//  StateAndDataFlowUI
//
//  Created by user on 16.12.2022.
//

import SwiftUI

struct RegisterView: View {

    @EnvironmentObject private var userManager: UserManager

    var body: some View {
        VStack {
            UserNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid
            )
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(!userManager.nameIsValid)
        }
    }
    
    private func registerUser() {
        userManager.user.isRegistered.toggle()
        StorageManager.shared.save(user: userManager.user)

    }
    
}

struct UserNameTF: View {
    
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text(name.count.formatted())
                    .font(.callout)
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
