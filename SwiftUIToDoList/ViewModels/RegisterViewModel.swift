//
//  RegisterViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {

    // MARK: - @Published
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""

    // MARK: - Init
    init() {}

    // MARK: - External Method
    func registration() {
        guard validateRegistration() else { return }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let sSelf = self,
                  let userId = result?.user.uid else { return }

            sSelf.insertUserRecord(id: userId)
        }
    }

}

// MARK: - private extension
private extension RegisterViewModel {

    func validateRegistration() -> Bool {
        guard name.trimmingCharacters(in: .whitespaces).isNotEmpty(),
              email.trimmingCharacters(in: .whitespaces).isNotEmpty(),
              password.trimmingCharacters(in: .whitespaces).isNotEmpty() else { return false }

        guard email.contains("@") && email.contains(".") else { return false }

        guard password.count >= 6 else { return false }

        return true
    }

    func insertUserRecord(id: String) {
        let newUser = UserModel(id: id,
                                name: name,
                                email: email,
                                joined: Date().timeIntervalSince1970)

        let db = Firestore.firestore()
        db.collection(Constants.users.rawValue)
            .document(id)
            .setData(newUser.asDictionary())
    }

}
