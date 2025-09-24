//
//  LegendModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct LegendModel: Identifiable {
    public let id: UUID
    public let title: String
    public let color: ColorAsset

    public init(
        id: UUID = UUID(),
        title: String,
        color: ColorAsset
    ) {
        self.id = id
        self.title = title
        self.color = color
    }
}
