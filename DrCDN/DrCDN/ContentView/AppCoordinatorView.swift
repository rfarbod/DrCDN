//
//  AppCoordinatorView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import AppUI
import FlowStacks
import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var viewModel: AppCoordinatorViewModel = .init()

    init(viewModel: AppCoordinatorViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        FlowStack($viewModel.routes) {
            rootView
        }
    }

    @ViewBuilder
    private var rootView: some View {
        switch viewModel.root {
        case .onboarding(let onboardingViewModel):
            OnboardingView(viewModel: onboardingViewModel)
        case .mainTabs:
            ContentView()
        }
    }
}
