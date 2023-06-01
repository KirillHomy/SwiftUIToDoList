//
//  ProfileViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {

    // MARK: - Published
    @Published var user: UserModel? = nil

    // MARK: - Init
    init() {}

    // MARK: - External Method
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }

    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()

        db.collection(Constants.users.rawValue)
            .document(userId)
            .getDocument { [weak self] snapshot, error  in
                guard let data = snapshot?.data(),
                      let sSelf = self,
                      error == nil else { return }

                DispatchQueue.main.async {
                    sSelf.user = UserModel(id: data[UserModelValue.id.rawValue] as? String ?? "",
                                           name: data[UserModelValue.name.rawValue] as? String ?? "",
                                           email: data[UserModelValue.email.rawValue] as? String ?? "",
                                           joined:data[ UserModelValue.joined.rawValue] as? TimeInterval ?? 0)
                }
            }
    }
}

