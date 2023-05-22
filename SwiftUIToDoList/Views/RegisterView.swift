//
//  RegisterView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // MARK: - Header
            HeaderView(title: "Register",
                       subTitle: "Start organizing todos",
                       angel: -15.0,
                       color: .yellow,
                       isNavigation: false)
            Spacer()
        }
        .background(.gray)

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
