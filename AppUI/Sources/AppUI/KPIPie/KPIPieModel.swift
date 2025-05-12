//
//  KPIModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation

public struct KPIPieModel: Sendable, Codable, Hashable, Equatable {
    public let id: String? = UUID().uuidString
    public var title: String
    public var subtitle: String
    public var chartData: PieChartModel?
    
    public init(
        title: String = Self.default.title,
        subtitle: String = Self.default.subtitle,
        chartData: PieChartModel? = Self.default.chartData
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chartData = chartData
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        rhs.id == lhs.id
    }
}

public extension KPIPieModel {
    static let `default`: KPIPieModel = .init(
        title: "",
        subtitle: "",
        chartData: nil
    )
}
