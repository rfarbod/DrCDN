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
    public let angularInset: CGFloat?
    public let opacity: Double?
    public let cornerRadius: CGFloat?
    public let innerRadius: CGFloat?
    
    public init(
        label: String,
        value: Double,
        color: String,
        angularInset: CGFloat?,
        opacity: Double?,
        cornerRadius: CGFloat? = nil,
        innerRadius: CGFloat? = nil
    ) {
        self.id = UUID().uuidString
        self.label = label
        self.value = value
        self.color = color
        self.angularInset = angularInset
        self.opacity = opacity
        self.cornerRadius = cornerRadius
        self.innerRadius = innerRadius
    }
}
