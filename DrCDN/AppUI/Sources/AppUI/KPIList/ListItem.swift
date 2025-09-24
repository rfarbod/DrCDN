//
//  ListModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation

public struct ListItem: Sendable, Codable, Hashable {
    let title: String
    let value: String
    
    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }
}
