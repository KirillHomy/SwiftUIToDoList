//
//  ToDoListView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {

    // MARK: - Private variables
    private var userId = ""

    // MARK: - StateObject
    @StateObject var toDoListViewModel = ToDoListViewModel()
    @FirestoreQuery var toDoListItemModels: [ToDoListItemModel]

    // MARK: - Init
    init(userId: String) {
        self.userId = userId
        self._toDoListItemModels = FirestoreQuery(collectionPath: "\(Constants.users.rawValue)/\(userId)/\(Constants.todolist.rawValue)")
    }

    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                List(toDoListItemModels) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                toDoListViewModel.delete(item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar { 
                Button {
                    toDoListViewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $toDoListViewModel.showingNewItemView) {
                NewItemView(newItemPresented: $toDoListViewModel.showingNewItemView)
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
