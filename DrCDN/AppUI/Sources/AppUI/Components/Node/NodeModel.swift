//
//  NodeModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct NodeModel {
    public let innerColor: ColorAsset
    public let outerColor: ColorAsset
    
    public init(
        innerColor: ColorAsset,
        outerColor: ColorAsset
    ) {
        self.innerColor = innerColor
        self.outerColor = outerColor
    }
}
