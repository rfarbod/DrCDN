//
//  Untitled.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation

public struct KPIListModel: Sendable, Codable, Hashable, Equatable {
    public let id: String? = UUID().uuidString
    public let listTitle: String
    public let items: [ListItem]
    
    public init(
        listTitle: String = Self.default.listTitle,
        items: [ListItem] = Self.default.items
    ) {
        self.listTitle = listTitle
        self.items = items
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        rhs.id == lhs.id
    }

}

public extension KPIListModel {
    static let `default`: KPIListModel = .init(
        listTitle: "",
        items: []
    )
}
