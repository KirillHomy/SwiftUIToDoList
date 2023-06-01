//
//  UserModel.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 21.05.2023.
//

import SwiftUI

enum UserModelValue: String {
    case id
    case name
    case email
    case joined
}

struct UserModel: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
