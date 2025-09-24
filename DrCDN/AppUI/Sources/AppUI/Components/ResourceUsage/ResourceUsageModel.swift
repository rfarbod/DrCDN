//
//  ResourceUsageModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation
import SwiftUI

public struct ResourceUsageModel {
    public let title: String
    public let icon: Image
    public let usage: Int
    public let changePercentage: Int
    public let description: String

    public init(
        title: String,
        icon: Image,
        usage: Int,
        changePercentage: Int,
        description: String
    ) {
        self.title = title
        self.icon = icon
        self.usage = usage
        self.changePercentage = changePercentage
        self.description = description
    }
}
