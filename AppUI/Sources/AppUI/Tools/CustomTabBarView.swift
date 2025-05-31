//
//  CustomTabBarView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import SwiftUI

public struct CustomTabBar: View {
    @Binding var selectedTab: Int

    let icons = ["house", "gear"]
    let labels = ["Home", "Settings"]

    public var body: some View {
        VStack(spacing: 0) {
            Divider().background(.white.opacity(0.2))

            HStack(spacing: 0) {
                ForEach(0..<5) { index in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedTab = index
                        }
                    }) {
                        VStack(spacing: 4) {
                            ZStack {
                                if selectedTab == index {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white.opacity(0.15))
                                        .frame(width: 64, height: 32)
                                        .overlay(
                                            Image(icons[index])
                                                .renderingMode(.template)
                                                .foregroundColor(.white.opacity(0.6))
                                        )
                                } else {
                                    Image(icons[index])
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
                Color(red: 13/255, green: 28/255, blue: 46/255)
                    .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
            )
        }
        .ignoresSafeArea()
    }
}
