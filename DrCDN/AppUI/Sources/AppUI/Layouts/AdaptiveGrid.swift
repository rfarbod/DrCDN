//
//  AdaptiveGrid.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI

public struct AdaptiveGrid<Content: View>: View {
    private let minItemWidth: CGFloat
    private let hSpacing: CGFloat
    private let vSpacing: CGFloat
    private let content: Content
    
    public init(
        minItemWidth: CGFloat = 250,
        hSpacing: CGFloat = 16,
        vSpacing: CGFloat = 16,
        @ViewBuilder content: () -> Content
    ) {
        self.minItemWidth = minItemWidth
        self.hSpacing = hSpacing
        self.vSpacing = vSpacing
        self.content = content()
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: minItemWidth), spacing: hSpacing)
                ],
                spacing: vSpacing
            ) {
                content
            }
            .padding(.horizontal, hSpacing)
            .padding(.vertical, vSpacing)
        }
        .frame(
            minWidth: 0,  maxWidth: .infinity,
            minHeight: 0, maxHeight: .infinity
        )
    }
}
