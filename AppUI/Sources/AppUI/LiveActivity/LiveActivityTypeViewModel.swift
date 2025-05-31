//
//  LiveActivityTypeViewModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import Foundation

public struct LiveActivityTypeModel: Identifiable, Sendable {
    public let id: String
    public let title: String
    public let description: String
    public let image: String
    public let onTap: (@Sendable () -> Void)?
    
    public init(
        id: String = Self.default.id,
        title: String = Self.default.title,
        description: String = Self.default.description,
        image: String = Self.default.image,
        onTap: (@Sendable() -> Void)? = Self.default.onTap
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.onTap = onTap
    }
}

public extension LiveActivityTypeModel {
    static let `default`: LiveActivityTypeModel = .init(
        id: UUID().uuidString,
        title: "",
        description: "",
        image: "",
        onTap: nil
    )
}
