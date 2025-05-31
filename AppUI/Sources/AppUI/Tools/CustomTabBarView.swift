//
//  CustomTabBarView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import SwiftUI

public struct CustomTabBar: View {
    @Binding public var selectedTab: Int

    let icons = ["house", "gear"]
    let labels = ["Home", "Settings"]
    
    public init(selectedTab: Binding<Int>) {
        self._selectedTab = selectedTab
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<2) { index in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedTab = index
                        }
                    }) {
                        VStack(spacing: 4) {
                            ZStack {
                                if selectedTab == index {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.primaryBackground.opacity(0.15))
                                        .frame(width: 64, height: 32)
                                        .overlay(
                                            Image(systemName: icons[index])
                                                .renderingMode(.template)
                                                .foregroundColor(.white.opacity(0.6))
                                        )
                                } else {
                                    Image(systemName: icons[index])
                                        .renderingMode(.template)
                                        .foregroundColor(.white.opacity(0.6))
                                }
                            }

                            Text(labels[index])
                                .font(.caption2)
                                .foregroundColor(selectedTab == index ? .white : .white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 8)
            .padding(.horizontal, 0)
            .frame(height: 90)
            .background(
                Color(Color.primaryBackground)
            )
        }
        .ignoresSafeArea()
    }
}
