//
//  ServerStautsModel.swift
//  AppUI
//
//  Created by Farbod on 6/3/25.
//

import SwiftUI

public struct ServerStautsModel: Sendable {
    public let title: String
    public let dotColor: Color
    public let number: Int
    
    public init(
        title: String = Self.default.title,
        dotColor: Color = Self.default.dotColor,
        number: Int = Self.default.number
    ) {
        self.title = title
        self.dotColor = dotColor
        self.number = number
    }
}

public extension ServerStautsModel {
    static let `default`: ServerStautsModel = .init(
        title: "",
        dotColor: Color.clear,
        number: 0
    )
}
