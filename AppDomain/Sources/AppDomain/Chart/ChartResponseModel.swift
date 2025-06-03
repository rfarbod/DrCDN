//
//  KPIBarViewModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

public struct ChartResponseModel: Codable, Hashable {
    public var xValues: [Double]
    public var yValues: [Double]
    
    public init(
        xValues: [Double],
        yValues: [Double]
    ) {
        self.xValues = xValues
        self.yValues = yValues
    }
}
