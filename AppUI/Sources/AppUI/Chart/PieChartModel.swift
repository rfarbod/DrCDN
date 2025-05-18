//
//  PieChartModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation
import SwiftUI

public struct PieChartModel: Sendable, Codable, Hashable {
    public var slices: [SliceModel]
    public var opacityRatio: Double
    
    public init(
        slices: [SliceModel],
        opacityRation: Double
    ) {
        self.slices = slices
        self.opacityRatio = opacityRation
    }
}
