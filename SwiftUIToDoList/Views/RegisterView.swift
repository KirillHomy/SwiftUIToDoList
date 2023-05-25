//
//  RegisterView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct RegisterView: View {

    // MARK: - ObservedObject
    @StateObject var registerViewModel = RegisterViewModel()

    var body: some View {
        VStack {
            // MARK: - Header
            HeaderView(title: "Register",
                       subTitle: "Start organizing todos",
                       angel: -15.0,
                       color: .yellow,
                       isNavigation: false)
            VStack {
                // Name
                TextField("Full Name", text: $registerViewModel.name)
                    .textFieldStyle(CustomTextFieldStyle())
                    .autocorrectionDisabled()
                // Mail
                TextField("Email Address", text: $registerViewModel.email)
                    .textFieldStyle(CustomTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                // Password
                SecureField("Password", text: $registerViewModel.password)
                    .textFieldStyle(CustomTextFieldStyle())
                // Button
                CustomButton(text: "Register", backgroundColor: .green) {
                    registerViewModel.registration()
                }

            }
            .frame(width: UIScreen.main.bounds.width - 32.0)
            .offset(y: -50.0)

            Spacer()
        }
        .background(.gray)

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
