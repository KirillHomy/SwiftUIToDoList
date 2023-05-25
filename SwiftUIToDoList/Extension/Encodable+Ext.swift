//
//  Encodable+Ext.swift
//  SwiftUIToDoList
//
//  Created by Kirill Khomytsevych on 25.05.2023.
//

import Foundation

extension Encodable {

    func asDictionary() -> [String: Any] {
        guard let date = try? JSONEncoder().encode(self) else { return [:] }
        do {
            let json = try JSONSerialization.jsonObject(with: date) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
