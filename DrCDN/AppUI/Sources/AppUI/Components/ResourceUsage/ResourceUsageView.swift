//
//  ResourceUsageView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//
import SwiftUI

public struct ResourceUsageView: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 18
        static let cardPadding: CGFloat = 16
        static let headerSpacing: CGFloat = 12
        static let usageValueFontSize: CGFloat = 34
        static let usageSuffixFontSize: CGFloat = 15
        static let changeChipFontSize: CGFloat = 12
        static let changeChipPaddingHorizontal: CGFloat = 10
        static let changeChipPaddingVertical: CGFloat = 4
        static let iconContainerSize: CGFloat = 44
        static let iconCornerRadius: CGFloat = 12
        static let footerPadding: CGFloat = 14
        static let footerSpacing: CGFloat = 8
        static let dividerOpacity: Double = 0.12
    }

    private let model: ResourceUsageModel

    public init(model: ResourceUsageModel) {
        self.model = model
    }

    public var body: some View {
        VStack(spacing: 0) {
            header
            Divider()
                .background(Color.textHigh.opacity(Constants.dividerOpacity))
                .blendMode(.plusLighter)
            footer
        }
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .fill(Color.textFieldBackground.opacity(0.9))
        )
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(Color.textMed.opacity(0.25), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: Constants.headerSpacing) {
                Text(model.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.textHigh)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .firstTextBaseline, spacing: 6) {
                        Text("\(model.usage)")
                            .font(.system(size: Constants.usageValueFontSize, weight: .semibold))
                            .foregroundStyle(Color.textHigh)
                        Text("%")
                            .font(.system(size: Constants.usageSuffixFontSize, weight: .medium))
                            .foregroundStyle(Color.textMed)
                    }

                    changeChip
                }
            }

            Spacer()

            RoundedRectangle(cornerRadius: Constants.iconCornerRadius, style: .continuous)
                .fill(Color.black.opacity(0.35))
                .frame(width: Constants.iconContainerSize, height: Constants.iconContainerSize)
                .overlay(
                    Image(asset: model.icon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.primaryGreen)
                )
        }
        .padding(Constants.cardPadding)
    }

    private var changeChip: some View {
        let color = changeColor
        return Text(changeText)
            .font(.system(size: Constants.changeChipFontSize, weight: .semibold))
            .foregroundStyle(color)
            .padding(.horizontal, Constants.changeChipPaddingHorizontal)
            .padding(.vertical, Constants.changeChipPaddingVertical)
            .background(color.opacity(0.18))
            .clipShape(Capsule())
    }

    private var footer: some View {
        HStack(spacing: Constants.footerSpacing) {
            Image(systemName: "waveform.path.ecg")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color.textMed)

            Text(model.description)
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(Color.textMed)

            Spacer()

            Image(systemName: "arrow.right")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color.textHigh.opacity(0.9))
        }
        .padding(.horizontal, Constants.cardPadding)
        .padding(.vertical, Constants.footerPadding)
        .background(Color.black.opacity(0.18))
    }

    private var changeText: String {
        let sign = model.changePercentage > 0 ? "+" : ""
        return "\(sign)\(model.changePercentage)%"
    }

    private var changeColor: Color {
        model.changePercentage >= 0 ? Color.primaryGreen : Color.textFieldError
    }
}

#Preview("ResourceUsageView") {
    ResourceUsageView(
        model: .init(
            title: "CPU Usage",
            icon: AppUIAssets.textFieldUser,
            usage: 47,
            changePercentage: -4,
            description: "3.8GHz | 12 Cores"
        )
    )
    .padding()
    .frame(width: 320)
    .background(Color.black)
}
