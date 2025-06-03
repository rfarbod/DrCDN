//
//  KPIPieResponseModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

import Foundation

public struct KPIPieResponseModel: Codable, Hashable {
    public var id: String? = UUID().uuidString
    public var title: String
    public var subtitle: String
    public var chartData: PieChartResponseModel?
    
    public init(
        title: String,
        subtitle: String,
        chartData: PieChartResponseModel?
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chartData = chartData
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        rhs.id == lhs.id
    }
}
