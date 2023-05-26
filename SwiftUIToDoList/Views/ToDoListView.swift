//
//  ToDoListView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct ToDoListView: View {

    // MARK: - Private variables
    private var userId = ""

    // MARK: - StateObject
    @StateObject var toDoListViewModel = ToDoListViewModel()

    // MARK: - Init
    init(userId: String) {
        self.userId = userId
    }

    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

// MARK: - PreviewProvider
struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
