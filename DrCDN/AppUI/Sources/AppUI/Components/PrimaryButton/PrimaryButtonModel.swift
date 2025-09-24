//
//  PrimaryButtonModel.swift
//  AppUI
//
//  Created by Codex on 9/24/25.
//

import Foundation

public struct PrimaryButtonModel {
    public let title: String
    public let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
}
