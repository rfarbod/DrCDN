//
//  RoundedTabBarView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import SwiftUI

enum AppTab: Hashable {
    case home
    case settings
}

struct ContentView: View {
    @State private var selection: AppTab = .home

    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house", value: AppTab.home) {
                HomeView()
            }

            Tab("Settings", systemImage: "gearshape", value: AppTab.settings) {
                SettingsView(viewModel: .init(model: .default))
            }
        }
    }
}
