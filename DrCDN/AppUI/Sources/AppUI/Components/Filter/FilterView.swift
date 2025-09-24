//
//  FilterView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct FilterView: View {
    private enum Constants {
        static let spacing: CGFloat = 8
        static let cornerRadius: CGFloat = 12
        static let horizontalPadding: CGFloat = 16
        static let controlHeight: CGFloat = 44
        static let titleFontSize: CGFloat = 13
        static let valueFontSize: CGFloat = 15
        static let iconFontSize: CGFloat = 12
    }
    
    public let model: FilterModel
    
    public init(model: FilterModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            Text(model.title)
                .font(.system(size: Constants.titleFontSize, weight: .semibold))
                .foregroundStyle(Color.textMed)
            
            Button(action: model.onTap) {
                HStack {
                    Text(model.placeholder)
                        .font(.system(size: Constants.valueFontSize, weight: .medium))
                        .foregroundStyle(Color.textHigh)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.down")
                        .font(.system(size: Constants.iconFontSize, weight: .semibold))
                        .foregroundStyle(Color.textMed)
                }
                .padding(.horizontal, Constants.horizontalPadding)
                .frame(height: Constants.controlHeight)
                .frame(maxWidth: .infinity)
                .background(Color.textFieldBackground)
                .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
            }
            .buttonStyle(.plain)
            .contentShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
            .accessibilityElement(children: .combine)
            .accessibilityLabel(Text(model.title))
            .accessibilityValue(Text(model.placeholder))
        }
    }
}

#Preview("FilterView") {
    FilterView(
        model: .init(
            title: "Group by",
            placeholder: "OS",
            onTap: {}
        )
    )
    .padding()
    .frame(width: 180)
    .background(Color.black)
}
