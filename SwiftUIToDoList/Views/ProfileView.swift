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

    // MARK: - Boby
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

// MARK: - PreviewProvider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
