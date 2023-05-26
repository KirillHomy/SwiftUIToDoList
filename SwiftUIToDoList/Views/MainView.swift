//
//  MainView.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

struct MainView: View {

    // MARK: - StateObject
    @StateObject var mainViewModel = MainViewModel()

    // MARK: - Boby
    var body: some View {
        if mainViewModel.isSignedIn(), mainViewModel.currentUserId.isNotEmpty() {
            accountView()
        } else {
            LoginView()
        }
    }

    // MARK: - ViewBuilder
    @ViewBuilder
    func accountView() -> some View {
        TabView {
            ToDoListView(userId: mainViewModel.currentUserId)
                .tabItem {
                    Label("Home",
                          systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile",
                          systemImage: "person.circle")
                }
        }
    }

}

// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
