//
//  LegendView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//
import SwiftUI

public struct LegendView: View {
    private enum Constants {
        static let spacing: CGFloat = 8
        static let swatchSize: CGFloat = 12
        static let swatchCornerRadius: CGFloat = 3
        static let fontSize: CGFloat = 12
    }

    private let model: LegendModel

    public init(model: LegendModel) {
        self.model = model
    }

    public var body: some View {
        HStack(spacing: Constants.spacing) {
            RoundedRectangle(cornerRadius: Constants.swatchCornerRadius, style: .continuous)
                .fill(Color(asset: model.color))
                .frame(width: Constants.swatchSize, height: Constants.swatchSize)

            Text(model.title)
                .font(.system(size: Constants.fontSize, weight: .medium))
                .foregroundStyle(Color.textHigh)
        }
    }
}

#Preview("LegendView") {
    LegendView(model: .init(title: "Live", color: AppUIAssets.primaryGreen))
        .padding()
        .background(Color.black)
}
