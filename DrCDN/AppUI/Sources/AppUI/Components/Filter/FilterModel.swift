//
//  FilterModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct FilterModel {
    public let title: String
    public let placeholder: String
    public let onTap: () -> Void
    
    public init(
        title: String,
        placeholder: String,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.placeholder = placeholder
        self.onTap = onTap
    }
}
