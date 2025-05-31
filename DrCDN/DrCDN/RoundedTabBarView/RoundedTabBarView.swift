//
//  RoundedTabBarView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI
import SwiftUI

struct RoundedTabBarView: View {
    @State private var selectedTab: Int
    
    init(selectedTab: Int = 0) {
        self.selectedTab = selectedTab
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {
                contentView(for: selectedTab)
                    .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
                    .background(Color.primaryBackground)
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
            ContentView()
        case 1:
            SettingsView(viewModel: .init(model: .init(settings: [])))
        default:
            EmptyView()
        }
    }
}
