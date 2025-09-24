//
//  PrimaryButton.swift
//  AppUI
//
//  Created by Farbod Rahimink on 9/24/25.
//

import SwiftUI

public struct PrimaryButton: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 18
        static let verticalPadding: CGFloat = 10
        static let fontSize: CGFloat = 16
    }
    
    private let model: PrimaryButtonModel
    
    public init(model: PrimaryButtonModel) {
        self.model = model
    }
    
    public var body: some View {
        Button(action: model.action) {
            Text(model.title)
                .font(.system(size: Constants.fontSize, weight: .semibold))
                .foregroundStyle(Color.textHigh)
                .frame(maxWidth: .infinity)
                .padding(.vertical, Constants.verticalPadding)
                .background(Color.primaryGreen)
                .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(model.title))
    }
}

#Preview("PrimaryButton") {
    PrimaryButton(model: .init(title: "Start", action: {}))
        .padding()
        .background(Color.black)
}
