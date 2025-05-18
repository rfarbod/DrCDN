//
//  KPIPieChartModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/18/25.
//

import CoreGraphics
import Foundation

public struct KPIPieChartModel: Sendable {
    private enum Constants {
        static let defaultSize: CGSize = .init(width: 100, height: 100)
    }
    
    public let slices: [SliceModel]
    public let frame: CGSize?
    
    public var total: Double {
        slices.map(\.value).reduce(0, +)
    }
    
    public init(
        slices: [SliceModel] = Self.default.slices,
        frame: CGSize? = Self.default.frame
    ) {
        self.slices = slices
        self.frame = frame
    }
}

public extension KPIPieChartModel {
    static let `default`: KPIPieChartModel = .init(
        slices: [],
        frame: .init(
            width: Constants.defaultSize.width,
            height: Constants.defaultSize.height
        )
    )
}
