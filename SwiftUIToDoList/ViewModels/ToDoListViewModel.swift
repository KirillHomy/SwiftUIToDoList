//
//  ToDoListViewModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

class ToDoListViewModel: ObservableObject {

    // MARK: - Published
    @Published var showingNewItemView = false

    // MARK: - Init
    init() {}

    // MARK: - External Method
    func delete(_ id: String) {
        
    }
}
