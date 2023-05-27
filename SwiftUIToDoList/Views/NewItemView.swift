//
//  NewItemView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct NewItemView: View {

    // MARK: - StateObject
    @StateObject var newItemViewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool

    // MARK: - Body
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32.0))
                .padding(.top, 50.0)
            Form {
                // Title
                TextField("Title", text: $newItemViewModel.title)
                // Due Date
                DatePicker("Due Date", selection: $newItemViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                CustomButton(text: "Save",
                             backgroundColor: .pink) {
                    if newItemViewModel.validateSave() {
                        newItemViewModel.save()
                        newItemPresented = false
                    } else {
                        newItemViewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $newItemViewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("f"))
            }
        }
    }
}

// MARK: - PreviewProvider
struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }) )
    }
}
