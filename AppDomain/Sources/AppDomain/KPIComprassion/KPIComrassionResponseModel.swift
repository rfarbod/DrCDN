//
//  KPIComrassionResponseModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

import Foundation

public struct KPIComparisonResponseModel: Codable {
    public let title: String
    public let subtitle: String?
    public let series: [[ChartResponseModel]]
    
    public init(
        title: String,
        subtitle: String?,
        series: [[ChartResponseModel]]
    ) {
        self.title = title
        self.subtitle = subtitle
        self.series = series
    }
}
