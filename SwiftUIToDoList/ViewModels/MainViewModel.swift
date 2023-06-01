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

    // MARK: - Init
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let sSelf = self else { return }

            DispatchQueue.main.async {
                sSelf.currentUserId = user?.uid ?? ""
            }
        }
    }

    // MARK: - External Method
    func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }

}
