//
//  ToDoListItemView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct ToDoListItemView: View {

    // MARK: - Private constants
    private let item: ToDoListItemModel

    // MARK: - Init
    init(item: ToDoListItemModel) {
        self.item = item
    }

    // MARK: - StateObject
    @StateObject var profileViewModel = ProfileViewModel()

    // MARK: - Body
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated,
                                                                         time: .shortened))
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button {
                profileViewModel.toggleIsDone(item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .imageScale(.large)
                    .foregroundColor(item.isDone ? .green : .red)
            }
        }
        .frame(height: 50.0)
    }
}

// MARK: - PreviewProvider
struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: ToDoListItemModel(id: "id",
                                                 title: "title",
                                                 dueDate: Date().timeIntervalSince1970,
                                                 createDate: Date().timeIntervalSince1970,
                                                 isDone: false ))
    }
}
