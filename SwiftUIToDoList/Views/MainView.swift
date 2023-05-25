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

    var body: some View {
        if mainViewModel.isSignedIn, mainViewModel.currentUserId.isNotEmpty() {
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
