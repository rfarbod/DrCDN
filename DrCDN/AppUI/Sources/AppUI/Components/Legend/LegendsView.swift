//
//  LegendsView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//
import SwiftUI

public struct LegendsView: View {
    private enum Constants {
        static let spacing: CGFloat = 20
    }

    private let model: LegendsModel

    public init(model: LegendsModel) {
        self.model = model
    }

    public var body: some View {
        HStack(spacing: Constants.spacing) {
            ForEach(model.items) { legend in
                LegendView(model: legend)
            }
        }
    }
}

#Preview("LegendsView") {
    LegendsView(
        model: .init(
            items: [
                .init(title: "Live", color: AppUIAssets.primaryGreen),
                .init(title: "Offline", color: AppUIAssets.secondaryAccent),
                .init(title: "Stale", color: AppUIAssets.tertiaryAccent),
                .init(title: "Unseen", color: AppUIAssets.cardBG)
            ]
        )
    )
    .padding()
    .background(Color.black)
}
