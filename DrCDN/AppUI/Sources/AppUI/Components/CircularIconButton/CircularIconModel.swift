//
//  CircularIconModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct CircularIconModel {
    public let icon: Image
    public let onTap: () -> Void
    
    public init(
        icon: Image,
        onTap: @escaping () -> Void
    ) {
        self.icon = icon
        self.onTap = onTap
    }
}
