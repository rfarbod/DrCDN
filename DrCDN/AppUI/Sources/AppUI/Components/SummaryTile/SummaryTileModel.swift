//
//  SummaryTileModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct SummaryItem: Identifiable, Equatable {
    public let id: UUID
    public let title: String
    public let value: Int
    public let isMain: Bool

    public init(
        id: UUID = UUID(),
        title: String,
        value: Int,
        isMain: Bool = false
    ) {
        self.id = id
        self.title = title
        self.value = value
        self.isMain = isMain
    }
}

public struct SummaryTileModel: Equatable {
    public let items: [SummaryItem]

    public init(items: [SummaryItem]) {
        self.items = items
    }
}
