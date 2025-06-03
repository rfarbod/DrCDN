//
//  ListItemResponseModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

import Foundation

public struct ListItemResponseModel: Codable {
    public let title: String
    public let value: String
    
    public init(
        title: String,
        value: String
    ) {
        self.title = title
        self.value = value
    }
}
