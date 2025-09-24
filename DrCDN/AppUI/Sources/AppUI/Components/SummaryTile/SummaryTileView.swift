//
//  SummaryTileView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct SummaryTileView: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 18
        static let tilePadding: CGFloat = 16
        static let mainSpacing: CGFloat = 8
        static let listSpacing: CGFloat = 20
        static let subHeadlineFontSize: CGFloat = 12
        static let mainValueFontSize: CGFloat = 32
        static let progressBarHeight: CGFloat = 8
    }

    private let model: SummaryTileModel

    public init(model: SummaryTileModel) {
        self.model = model
    }

    public var body: some View {
        VStack(spacing: Constants.listSpacing) {
            if let main = model.items.first(where: { $0.isMain }) ?? model.items.first {
                VStack(spacing: Constants.mainSpacing) {
                    Text(main.title)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color.textMed)

                    Text("\(main.value)")
                        .font(.system(size: Constants.mainValueFontSize, weight: .semibold))
                        .foregroundStyle(Color.textHigh)
                }
            }

            HStack(spacing: 28) {
                ForEach(model.items.filter { !$0.isMain }) { item in
                    VStack(spacing: 4) {
                        Text("\(item.value)")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(Color.textHigh)
                        Text(item.title)
                            .font(.system(size: Constants.subHeadlineFontSize))
                            .foregroundStyle(Color.textMed)
                    }
                }
            }

            ProgressBar(items: model.items.filter { !$0.isMain })
                .frame(height: Constants.progressBarHeight)
        }
        .padding(Constants.tilePadding)
        .frame(width: 164)
        .background(Color.textFieldBackground)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(Color.textMed.opacity(0.35), lineWidth: 1)
        )
    }
}

private struct ProgressBar: View {
    let items: [SummaryItem]

    var total: Double {
        let sum = items.map { Double($0.value) }.reduce(0, +)
        return sum == 0 ? 1 : sum
    }

    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            HStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    let fraction = CGFloat(Double(item.value) / total)
                    Rectangle()
                        .fill(color(for: index))
                        .frame(width: max(width * fraction, fraction > 0 ? 1 : 0), height: proxy.size.height)
                }
            }
        }
        .cornerRadius(4)
    }

    private func color(for index: Int) -> Color {
        switch index {
        case 0: return Color.primaryGreen
        case 1: return Color.textMed.opacity(0.8)
        default: return Color.textMed.opacity(0.4)
        }
    }
}

#Preview("SummaryTileView") {
    SummaryTileView(
        model: .init(
            items: [
                SummaryItem(title: "Total nodes", value: 36, isMain: true),
                SummaryItem(title: "Live", value: 25),
                SummaryItem(title: "Offline", value: 4),
                SummaryItem(title: "Stale", value: 7)
            ]
        )
    )
    .frame(width: 160)
    .padding()
    .background(Color.black)
}
