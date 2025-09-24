//
//  NodeView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct NodeView: View {
    private enum Constants {
        static let size = CGSize(width: 24, height: 28)
        static let borderWidth: CGFloat = 3
    }
    
    public let model: NodeModel
    
    public init(model: NodeModel) {
        self.model = model
    }
    
    public var body: some View {
        HexagonShape()
            .fill(Color(asset: model.outerColor))
            .overlay(
                HexagonShape()
                    .inset(by: Constants.borderWidth)
                    .fill(Color(asset: model.innerColor))
            )
            .frame(width: Constants.size.width, height: Constants.size.height)
    }
}

private struct HexagonShape: InsettableShape {
    private var insetAmount: CGFloat = 0
    
    func inset(by amount: CGFloat) -> HexagonShape {
        var shape = self
        shape.insetAmount += amount
        return shape
    }
    
    func path(in rect: CGRect) -> Path {
        let insetRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        let midX = insetRect.midX
        let minX = insetRect.minX
        let maxX = insetRect.maxX
        let minY = insetRect.minY
        let maxY = insetRect.maxY
        let verticalInset = insetRect.height * 0.25
        
        var path = Path()
        path.move(to: CGPoint(x: midX, y: minY))
        path.addLine(to: CGPoint(x: maxX, y: minY + verticalInset))
        path.addLine(to: CGPoint(x: maxX, y: maxY - verticalInset))
        path.addLine(to: CGPoint(x: midX, y: maxY))
        path.addLine(to: CGPoint(x: minX, y: maxY - verticalInset))
        path.addLine(to: CGPoint(x: minX, y: minY + verticalInset))
        path.closeSubpath()
        return path
    }
}

#Preview("NodeView") {
    NodeView(model: .init(innerColor: AppUIAssets.surface, outerColor: AppUIAssets.primaryAccent))
        .padding()
        .background(Color.black)
}
