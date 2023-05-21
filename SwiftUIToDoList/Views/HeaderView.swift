//
//  HeaderView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: .zero)
                .foregroundColor(.orange)
                .rotationEffect(Angle(degrees: 15.0))
            // Text
            VStack {
                Text("To Do List")
                    .font(.system(size: 50.0))
                    .bold()
                    .foregroundColor(.white)
                Text("Get things done")
                    .font(.system(size: 30.0))
                    .foregroundColor(.white)
            }
            .padding(.top, 60)
        }
        .frame(width: UIScreen.main.bounds.height,
               height: 300.0)
        .offset(y:-100.0)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
