//
//  NewItemViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

class NewItemViewModel: ObservableObject {

    // MARK: - Published
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    // MARK: - Init
    init() {}

    // MARK: - External Method
    func save() {
        //
    }

    func validateSave() -> Bool {
        guard title.trimmingCharacters(in: .whitespaces).isNotEmpty() else { return false }

        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }

        return true
    }

}
