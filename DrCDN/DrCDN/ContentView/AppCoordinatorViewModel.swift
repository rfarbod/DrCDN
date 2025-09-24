//
//  AppCoordinatorViewModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import FlowStacks
import Combine

@MainActor
final class AppCoordinatorViewModel: ObservableObject {
    enum Screens: Hashable {
        case onboarding(OnboardingViewModel)
        case mainTabs
    }

    enum Screen: Hashable {}

    @Published private(set) var root: Screens
    @Published var routes: Routes<Screen> = []

    private var hasCompletedOnboarding: Bool

    init(hasCompletedOnboarding: Bool = false) {
        self.hasCompletedOnboarding = hasCompletedOnboarding
        self.root = .mainTabs
        configureInitialRoot()
    }

    func restartOnboarding() {
        hasCompletedOnboarding = false
        configureInitialRoot()
    }

    private func configureInitialRoot() {
        if hasCompletedOnboarding {
            root = .mainTabs
        } else {
            root = .onboarding(
                OnboardingViewModel(onComplete: { [weak self] in
                    self?.completeOnboarding()
                })
            )
        }
        routes = []
    }

    private func completeOnboarding() {
        guard case .onboarding = root else { return }
        hasCompletedOnboarding = true
        root = .mainTabs
        routes = []
    }
}
