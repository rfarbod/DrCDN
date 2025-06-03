//
//  OppositeDataModel.swift
//  AppUI
//
//  Created by Farbod on 6/3/25.
//

public struct OppositeDataModel {
    public let title: String
    public let upperIcon: String
    public let lowerIcon: String
    public let upperSpeed: Double
    public let lowerSpeed: Double
    
    public init(
        title: String,
        upperIcon: String,
        lowerIcon: String,
        upperSpeed: Double,
        lowerSpeed: Double
    ) {
        self.title = title
        self.upperIcon = upperIcon
        self.lowerIcon = lowerIcon
        self.upperSpeed = upperSpeed
        self.lowerSpeed = lowerSpeed
    }
}
