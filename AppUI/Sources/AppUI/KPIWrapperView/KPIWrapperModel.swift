//
//  KPIWrapperModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import Foundation

public struct KPIWrapperModel: Identifiable, Hashable, Equatable {
    public let id: String
    public let type: KPIViewType
    
    public init(
        type: KPIViewType
    ) {
        self.id = UUID().uuidString
        self.type = type
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
