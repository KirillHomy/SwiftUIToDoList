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
    private var margin = 50.0

    // MARK: - StateObject
    @StateObject var toDoListViewModel: ToDoListViewModel

    // MARK: - FirestoreQuery
    @FirestoreQuery var toDoListItemModels: [ToDoListItemModel]

    // MARK: - Init
    init(userId: String) {
        self.userId = userId
        self._toDoListItemModels = FirestoreQuery(collectionPath: "\(Constants.users.rawValue)/\(userId)/\(Constants.todolist.rawValue)")
        self._toDoListViewModel = StateObject(wrappedValue: ToDoListViewModel(userID: userId))
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
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
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
