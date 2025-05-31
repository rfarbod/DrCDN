//
//  SettingsRowModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/31/25.
//

public struct SettingsRowModel: Identifiable, Sendable {
    public let id: String
    public let image: String
    public let title: String
    public let leftImage: String
    
    public init(
        id: String = Self.default.image,
        image: String = Self.default.image,
        title: String = Self.default.title,
        leftImage: String = Self.default.leftImage
    ) {
        self.id = id
        self.image = image
        self.title = title
        self.leftImage = leftImage
    }
}

public extension SettingsRowModel {
    static let `default`: SettingsRowModel = .init(
        image: "",
        title: "",
        leftImage: ""
    )
}
