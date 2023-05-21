//
//  CustomTextFieldStyle.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    @Environment(\.colorScheme) var colorScheme
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        let backgroundColor = colorScheme == .dark ? Color.orange : Color.orange.opacity(0.5)

        configuration
            .accentColor(.orange)
            .padding()
            .frame(height: 40.0)
            .background(backgroundColor.opacity(0.5)) // Установите нужный цвет фона
            .cornerRadius(8.0)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.orange, lineWidth: 1.0) // Установите нужный цвет границы
            )
    }
}
