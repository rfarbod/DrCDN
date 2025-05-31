//
//  RoundedCorner.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import Foundation
import SwiftUI
import UIKit

public struct RoundedCorner: Shape {
    public var radius: CGFloat
    public var corners: UIRectCorner
    
    public init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
