//
//  MainViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseAuth

class MainViewModel: ObservableObject {

    // MARK: - Published
    @Published var currentUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let sSelf = self,
                  let user = user else { return }

            DispatchQueue.main.async {
                sSelf.currentUserId = user.uid
            }
        }
    }

    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }

}
