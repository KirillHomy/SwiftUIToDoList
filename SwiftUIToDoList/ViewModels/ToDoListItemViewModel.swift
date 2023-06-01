//
//  ToDoListItemViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject {

    // MARK: - Init
    init() {}

    // MARK: - External Method
    func toggleIsDone(_ item: ToDoListItemModel) {
        var copyItem = item
        copyItem.setDone(!item.isDone)

        guard let userId = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()

        db.collection(Constants.users.rawValue)
            .document(userId)
            .collection(Constants.todolist.rawValue)
            .document(copyItem.id)
            .setData(copyItem.asDictionary())
    }

}
