//
//  CircularIconButton.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct CircularIconButton: View {
    private enum Constants {
        static let diameter: CGFloat = 40
        static let iconSize: CGFloat = 15
        static let borderWidth: CGFloat = 3
        static let innerPadding: CGFloat = 18
        static let shadowRadius: CGFloat = 12
        static let shadowYOffset: CGFloat = 6
    }

    private let model: CircularIconModel

    public init(model: CircularIconModel) {
        self.model = model
    }

    public var body: some View {
        Button(action: model.onTap) {
            model.icon
                .resizable()
                .scaledToFit()
                .frame(width: Constants.iconSize, height: Constants.iconSize)
                .foregroundStyle(Color.primaryGreen)
                .padding(Constants.innerPadding)
                .frame(width: Constants.diameter, height: Constants.diameter)
                .background(
                    Circle()
                        .fill(Color.textFieldBackground)
                )
                .overlay(
                    Circle()
                        .stroke(Color.textMed.opacity(0.65), lineWidth: Constants.borderWidth)
                )
        }
        .buttonStyle(.plain)
        .shadow(color: Color.black.opacity(0.24), radius: Constants.shadowRadius, y: Constants.shadowYOffset)
        .accessibilityLabel(Text("Icon button"))
    }
}
