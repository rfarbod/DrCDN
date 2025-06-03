//
//  KPIBarResponseModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

import Foundation

public struct KPIBarResponseModel: Codable, Hashable {
    public var id: String? = UUID().uuidString
    public let title: String
    public let subtitle: String
    public let chartData: ChartResponseModel?
    
    public init(
        title: String,
        subtitle: String,
        chartData: ChartResponseModel?
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chartData = chartData
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
