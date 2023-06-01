//
//  ProfileView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct ProfileView: View {

    // MARK: - StateObject
    @StateObject var profileViewModel = ProfileViewModel()

    // MARK: - State
    @State private var showMainView = false

    // MARK: - Boby
    var body: some View {
        NavigationView {
            VStack {
                if let user = profileViewModel.user {
                    setupProfileView(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            profileViewModel.fetchUser()
        }
    }

    @ViewBuilder
    func setupProfileView(user: UserModel) -> some View {
        Spacer()
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.orange)
            .frame(width: 125.0, height: 125.0)
            .padding()
        VStack (alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack {
                Text("Member Since: ")
                    .bold()
                Text(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))
            }
        }
        .padding()
        Spacer()
        CustomButton(text: "Log Out", backgroundColor: .red) {
            profileViewModel.logOut()
        }
        .frame(width: UIScreen.main.bounds.width - 32.0)
        Spacer()
    }
}

// MARK: - PreviewProvider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
