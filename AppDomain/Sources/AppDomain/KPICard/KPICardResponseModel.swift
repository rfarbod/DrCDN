//
//  KPICardResponseModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

import Foundation

public struct KPICardResponseModel: Codable, Hashable {
    public var title: String
    public var leftValue: String
    public var leftUnit: String
    public var rightValue: String
    public var rightUnit: String
    public var chartData: ChartResponseModel?
    
    public init(
        title: String,
        leftValue: String,
        leftUnit: String,
        rightValue: String,
        rightUnit: String,
        chartData: ChartResponseModel?
    ) {
        self.title = title
        self.leftValue = leftValue
        self.leftUnit = leftUnit
        self.rightValue = rightValue
        self.rightUnit = rightUnit
        self.chartData = chartData
    }
}
