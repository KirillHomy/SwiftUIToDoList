//
//  LoginViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func setLogin() {
        guard validateEnter() else { return }

        Auth.auth().signIn(withEmail: email, password: password)
    }

    func validateEnter() -> Bool {
        errorMessage = ""
        guard email.trimmingCharacters(in: .whitespaces).isNotEmpty(),
              password.trimmingCharacters(in: .whitespaces).isNotEmpty() else {
            errorMessage = "Please fill in all fields."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }

}
