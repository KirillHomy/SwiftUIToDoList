//
//  LoginView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct LoginView: View {

    // MARK: - @State
    @StateObject var loginViewModel = LoginViewModel()

    // MARK: - Boby
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Header
                HeaderView(title: "To Do List",
                           subTitle: " Get things done",
                           angel: 15.0,
                           color: .orange,
                           isNavigation: true)

                // MARK: - Login form
                VStack {
                    TextField("Email Address", text: $loginViewModel.email)
                        .textFieldStyle(CustomTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $loginViewModel.password)
                        .textFieldStyle(CustomTextFieldStyle())
                    CustomButton(text: "Log In",
                                 backgroundColor: .orange) {
                        loginViewModel.setLogin()
                    }
                    if loginViewModel.errorMessage.isNotEmpty() {
                        Text(loginViewModel.errorMessage)
                            .padding()
                            .foregroundColor(.red)
                            .background(Color.black)
                            .cornerRadius(10.0)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 32.0)

                Spacer()
                // MARK: - Create Account
                VStack {
                    Text("New around here?")
                        .foregroundColor(.white)
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                    .foregroundColor(.black)
                    .padding(.bottom, 50.0)
                }

            }
            .background(.gray)
        }
    }

}

// MARK: - PreviewProvider
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

