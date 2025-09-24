//
//  OnboardingViewModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import AppUI
import SwiftUI

@MainActor
final class OnboardingViewModel: ObservableObject {
    @Published private(set) var model: OnboardingModel = .init(items: [])
    @Published var selection: Int = 0

    private let onComplete: () -> Void

    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
        configureSteps()
    }

    func configureSteps() {
        let steps: [(image: Image, title: String, description: String, cta: String)] = [
            (
                image: DrCDNAssets.onboarding1.swiftUIImage,
                title: DrCDNLocalized.Onboarding.Step1.title,
                description: DrCDNLocalized.Onboarding.Step1.description,
                cta: "Next"
            ),
            (
                image: DrCDNAssets.onboarding2.swiftUIImage,
                title: DrCDNLocalized.Onboarding.Step2.title,
                description: DrCDNLocalized.Onboarding.Step2.description,
                cta: "Next"
            ),
            (
                image: DrCDNAssets.onboarding3.swiftUIImage,
                title: DrCDNLocalized.Onboarding.Step3.title,
                description: DrCDNLocalized.Onboarding.Step3.description,
                cta: "Start"
            )
        ]

        model = OnboardingModel(
            items: steps.enumerated().map { index, step in
                OnboardingStepView(
                    model: .init(
                        image: step.image,
                        title: step.title,
                        description: step.description,
                        ctaText: step.cta,
                        onTap: { [weak self] in
                            self?.advance(from: index)
                        }
                    )
                )
            }
        )

        selection = 0
    }

    private func advance(from index: Int) {
        if index < model.items.count - 1 {
            withAnimation {
                selection = index + 1
            }
        } else {
            onComplete()
        }
    }
}

extension OnboardingViewModel: Hashable {
    nonisolated static func == (lhs: OnboardingViewModel, rhs: OnboardingViewModel) -> Bool {
        lhs === rhs
    }

    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
