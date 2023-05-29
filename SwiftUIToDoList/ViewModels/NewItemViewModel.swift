//
//  NewItemViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {

    // MARK: - Published
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    // MARK: - Init
    init() {}

    // MARK: - External Method
    func save() {
        guard validateSave() else { return }

        // Get current user ID
        guard let userId = Auth.auth().currentUser?.uid else { return }
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItemModel(id: newId,
                                        title: title,
                                        dueDate: dueDate.timeIntervalSince1970,
                                        createDate: Date().timeIntervalSince1970,
                                        isDone: false)
        // Save model
        let db = Firestore.firestore()

        db.collection(Constants.users.rawValue)
            .document(userId)
            .collection(Constants.todolist.rawValue)
            .document(newId)
            .setData(newItem.asDictionary())
    }

    func validateSave() -> Bool {
        guard title.trimmingCharacters(in: .whitespaces).isNotEmpty() else { return false }

        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }

        return true
    }

}
