//
//  KPICardModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation

public struct KPICardModel: Sendable, Codable, Hashable {
    public var title: String
    public var leftValue: String
    public var leftUnit: String
    public var rightValue: String
    public var rightUnit: String
    public var chartData: ChartModel?
    
    public init(
        title: String = Self.default.title,
        leftValue: String = Self.default.leftValue,
        leftUnit: String = Self.default.leftUnit,
        rightValue: String = Self.default.rightValue,
        rightUnit: String = Self.default.rightUnit,
        chartData: ChartModel? = Self.default.chartData
    ) {
        self.title = title
        self.leftValue = leftValue
        self.leftUnit = leftUnit
        self.rightValue = rightValue
        self.rightUnit = rightUnit
        self.chartData = chartData
    }
}

public extension KPICardModel {
    static let `default`: KPICardModel = .init(
        title: "",
        leftValue: "",
        leftUnit: "",
        rightValue: "",
        rightUnit: "",
        chartData: nil
    )
}
