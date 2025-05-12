//
//  SliceModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation

public struct SliceModel: Identifiable, Sendable, Codable, Hashable {
    public let id: String
    public let label: String
    public let value: Double
    public let color: String
    
    public init(label: String, value: Double, color: String) {
        self.id = UUID().uuidString
        self.label = label
        self.value = value
        self.color = color
    }
}
