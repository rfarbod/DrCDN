//
//  RoundedTabBarView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI
import SwiftUI

struct RoundedTabBarView: View {
    @State private var selectedTab = 0
    
    init(selectedTab: Int = 0) {
        _selectedTab = .init(initialValue: selectedTab)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {
                contentView(for: selectedTab)
                    .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
                    .background(Color(.white))
            }
            .padding(.bottom, 90)

            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
    }

    @ViewBuilder
    private func contentView(for tab: Int) -> some View {
        switch tab {
        case 0:
            DashboardCoordinator()
        case 1:
            ModulesCoordinator()
        case 2:
            QRCodeCoordinator(coordinatorViewModel: .init())
        case 3:
            SelectAreaView(viewModel: .init(
                coordinator: .init(),
                repository: dashboardRepository
            ))
        case 4:
            SettingsCoordinatorView(viewModel: .init())

        case 5:
            ProfileView(viewModel: .init(coordinator: .init(), repository: dashboardRepository))

        default:
            DashboardCoordinator()
        }
    }
}
