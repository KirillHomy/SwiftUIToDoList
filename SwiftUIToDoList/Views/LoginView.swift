//
//  LoginView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct LoginView: View {

    // MARK: - @State
    @State var email = ""
    @State var password = ""

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
                    TextField("Email Address", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                    Button {
                        //
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.orange)
                            Text("Log In")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 50.0)
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

