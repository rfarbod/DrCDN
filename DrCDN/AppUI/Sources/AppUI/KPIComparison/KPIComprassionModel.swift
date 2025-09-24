//
//  KPIComprassionModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

public struct KPIComparisonModel: Sendable, Codable, Hashable {
    public let title: String
    public let subtitle: String?
    public let series: [[ChartModel]]
    
    public init(
        title: String = Self.default.title,
        subtitle: String? = Self.default.subtitle,
        series: [[ChartModel]] = Self.default.series
    ) {
        self.title = title
        self.subtitle = subtitle
        self.series = series
    }
}

public extension KPIComparisonModel {
    static let `default`: KPIComparisonModel = .init(
        title: "",
        subtitle: nil,
        series: []
    )
}
