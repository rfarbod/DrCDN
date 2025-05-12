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
    
    public init(slices: [SliceModel]) {
        self.slices = slices
    }
}
