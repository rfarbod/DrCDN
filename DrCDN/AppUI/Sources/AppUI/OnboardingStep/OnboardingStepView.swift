//
//  OnboardingStepView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct OnboardingStepView: View {
    private enum Constants {
        static let verticalSpacing: CGFloat = 28
        static let bodySpacing: CGFloat = 10
        static let imageHeight: CGFloat = 250
        static let contentWidth: CGFloat = 255
        static let descriptionWidth: CGFloat = 240
        static let titleFontSize: CGFloat = 18
        static let descriptionFontSize: CGFloat = 13
        static let buttonWidth: CGFloat = 255
    }

    private let model: OnboardingStepModel

    public init(model: OnboardingStepModel) {
        self.model = model
    }

    public var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            model.image
                .resizable()
                .scaledToFit()
                .frame(width: Constants.contentWidth, height: Constants.imageHeight)

            VStack(spacing: Constants.bodySpacing) {
                Text(model.title)
                    .font(.system(size: Constants.titleFontSize, weight: .semibold))
                    .foregroundStyle(Color.textHigh)
                    .multilineTextAlignment(.leading)

                Text(model.description)
                    .font(.system(size: Constants.descriptionFontSize))
                    .foregroundStyle(Color.textMed)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: Constants.descriptionWidth)
            }

            PrimaryButton(
                model: .init(
                    title: model.ctaText,
                    action: model.onTap
                )
            )
            .frame(width: Constants.buttonWidth)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview("OnboardingStepView") {
    OnboardingStepView(
        model: .init(
            image: Image(systemName: "chart.bar.fill"),
            title: "Data-driven intelligent decision-making",
            description: "Intelligent recommendations for performance improvement, error reduction, resource optimization, and system response quality assessment.",
            ctaText: "Start",
            onTap: {}
        )
    )
    .padding()
    .background(Color.primaryBackground)
}
