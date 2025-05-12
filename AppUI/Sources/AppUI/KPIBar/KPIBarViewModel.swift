//
//  KPIBarViewModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation

public struct KPIBarViewModel: Sendable, Codable, Hashable, Equatable {
    public let id: String? = UUID().uuidString
    public let title: String
    public let subtitle: String
    public let chartData: ChartModel?
    
    public init(
        title: String = Self.default.title,
        subtitle: String = Self.default.subtitle,
        chartData: ChartModel? = Self.default.chartData
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chartData = chartData
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

}

public extension KPIBarViewModel {
    static let `default`: KPIBarViewModel = .init(title: "", subtitle: "", chartData: nil)
}
