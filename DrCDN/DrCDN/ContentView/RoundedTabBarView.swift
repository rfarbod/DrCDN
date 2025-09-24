//
//  RoundedTabBarView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI
import SwiftUI

enum AppTab: Hashable {
    case home
    case network
    case sources
    case messages
    case menu
}

struct ContentView: View {
    @State private var selection: AppTab = .home

    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", image: "home", value: AppTab.home) {
                HomeView()
            }

            Tab("Network", image: "network", value: AppTab.network) {
                placeholderScreen(title: "Network")
            }

            Tab("Sources", image: "sources", value: AppTab.sources) {
                placeholderScreen(title: "Sources")
            }

            Tab("Message", image: "messages", value: AppTab.messages) {
                placeholderScreen(title: "Message")
            }

            Tab("Settings", systemImage: "gearshape.fill", value: AppTab.menu) {
                SettingsView(viewModel: .init(model: .default))
            }
        }
    }

    @ViewBuilder
    private func placeholderScreen(title: String) -> some View {
        ZStack {
            Image(.primaryBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Text(title)
                .font(.title3)
                .foregroundStyle(Color.textHigh)
        }
    }
}
