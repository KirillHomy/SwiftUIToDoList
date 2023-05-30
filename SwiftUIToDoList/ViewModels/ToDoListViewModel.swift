//
//  ToDoListViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {

    // MARK: - Private constants
    private let userID: String

    // MARK: - Published
    @Published var showingNewItemView = false

    // MARK: - Init
    init(userID: String) {
        self.userID = userID
    }

    // MARK: - External Method
    func delete(_ id: String) {
        let db = Firestore.firestore()
        db.collection(Constants.users.rawValue)
            .document(userID)
            .collection(Constants.todolist.rawValue)
            .document(id)
            .delete()
    }
}
