//
//  HeaderView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct HeaderView: View {

    var title: String
    var subTitle: String
    var angel: Double
    var color: Color
    var isNavigation: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: .zero)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: angel))
            // Text
            VStack {
                Text(title)
                    .font(.system(size: 50.0))
                    .bold()
                    .foregroundColor(.white)
                Text(subTitle)
                    .font(.system(size: 30.0))
                    .foregroundColor(.white)
            }
            .padding(.top, 100)
        }
        .frame(width: UIScreen.main.bounds.height,
               height: 350.0)
        .offset(y: isNavigation ? -100.0 : -150.0)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subTitle: "SubTitle",
                   angel: 0.0,
                   color: .blue,
                   isNavigation: false)
    }
}
