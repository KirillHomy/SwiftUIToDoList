//
//  CustomButton.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 23.05.2023.
//

import SwiftUI

struct CustomButton: View {

    var text: String
    var backgroundColor: Color
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(backgroundColor)
                Text(text)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .frame(height: 50.0)

    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Text", backgroundColor: .clear) {
            // Action
        }
    }
}
