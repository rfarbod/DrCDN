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
    
    public init(
        id: String = Self.default.id,
        title: String = Self.default.title,
        description: String = Self.default.description,
        image: String = Self.default.image
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
    }
}

public extension LiveActivityTypeModel {
    static let `default`: LiveActivityTypeModel = .init(
        id: UUID().uuidString,
        title: "",
        description: "",
        image: ""
    )
}
