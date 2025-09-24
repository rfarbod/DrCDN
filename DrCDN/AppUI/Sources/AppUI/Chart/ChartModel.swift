//
//  ChartData.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

public struct ChartModel: Sendable, Codable, Hashable {
    public var xValues: [Double]
    public var yValues: [Double]
    
    public init(
        xValues: [Double] = Self.default.xValues,
        yValues: [Double] = Self.default.yValues
    ) {
        self.xValues = xValues
        self.yValues = yValues
    }
}

public extension ChartModel {
    static let `default`: ChartModel = .init(
        xValues: [],
        yValues: []
    )
}
