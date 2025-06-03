//
//  KPIListResponseModel.swift
//  AppDomain
//
//  Created by Farbod on 6/3/25.
//

import Foundation

public struct KPIListResponseModel: Codable {
    public var id: String? = UUID().uuidString
    public let listTitle: String
    public let items: [ListItemResponseModel]
    
    public init(
        listTitle: String,
        items: [ListItemResponseModel]
    ) {
        self.listTitle = listTitle
        self.items = items
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        rhs.id == lhs.id
    }

}
