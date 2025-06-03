//
//  PieChartResponseModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

public struct PieChartResponseModel: Codable, Hashable {
    public var slices: [SliceResponseModel]
    public var opacityRatio: Double
    
    public init(
        slices: [SliceResponseModel],
        opacityRation: Double
    ) {
        self.slices = slices
        self.opacityRatio = opacityRation
    }
}
