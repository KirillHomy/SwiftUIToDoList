//
//  HeaderView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct HeaderView: View {

    // MARK: - Private(set) variables
    private(set) var title: String
    private(set) var subTitle: String
    private(set) var angel: Double
    private(set) var color: Color
    private(set) var isNavigation: Bool

    // MARK: - Body
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

// MARK: - PreviewProvider
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subTitle: "SubTitle",
                   angel: 0.0,
                   color: .blue,
                   isNavigation: false)
    }
}
