//
//  MetricDisturbutionModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct MetricBreakdown: Identifiable, Equatable {
    public enum Kind: Equatable {
        case critical
        case warning

        var color: Color {
            switch self {
            case .critical: return Color(.sRGB, red: 0.804, green: 0.388, blue: 0.388, opacity: 1)
            case .warning: return Color(.sRGB, red: 0.843, green: 0.757, blue: 0.357, opacity: 1)
            }
        }

        var title: String {
            switch self {
            case .critical: return "Critical"
            case .warning: return "Warning"
            }
        }
    }

    public let id: Kind
    public let value: Int

    public init(kind: Kind, value: Int) {
        self.id = kind
        self.value = value
    }
}

public struct MetricDisturbutionModel: Equatable {
    public let title: String
    public let breakdown: [MetricBreakdown]

    public init(title: String, breakdown: [MetricBreakdown]) {
        self.title = title
        self.breakdown = breakdown
    }

    public var total: Int {
        breakdown.map { $0.value }.reduce(0, +)
    }
}
